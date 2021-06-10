

import React, { useState, useEffect, useCallback } from 'react'
import {
    Modal, ScrollView, RefreshControl,
    Pressable, Text, View, Alert,
    TextInput, ActivityIndicator, Button, StyleSheet
} from 'react-native'

import MyText from '../components/MyText'
import { Picker } from '@react-native-picker/picker'

import DateTimePickerModal from "react-native-modal-datetime-picker"

import firebase from '../utilities/firebaseDB'

const Details = props => {
    const { navigation, route: { params: { key } } } = props
    const [post, setPost] = useState(null)
    const [visible, setVisible] = useState(false)
    const [refreshing, setRefreshing] = useState(false)

    const [tieuDe, setTieuDe] = useState('')
    const [noiDung, setNoiDung] = useState('')

    const [isLoading, setIsLoading] = useState(false)

    const [selectedLanguage, setSelectedLanguage] = useState(4)
    const [programingLanguages, setProgramingLanguages] = useState([])

    const [date, seDate] = useState(null)

    const [isDatePickerVisible, setDatePickerVisibility] = useState(false)

    const showDatePicker = () => { setDatePickerVisibility(true) }

    const hideDatePicker = () => { setDatePickerVisibility(false) }

    const handleConfirm = (date) => {
        seDate(date)
        setDatePickerVisibility(false);
    }

    useEffect(async () => {
        const res = await firebase.firestore()
            .collection('posts')
            .doc(key).get()
        if (res.exists) {
            const { id, title, body } = res.data()
            setPost({ id, title, body, key: res.id })
            setTieuDe(title)
            setNoiDung(body)
        }
        return res
    }, [key])

    useEffect(() => {
        const fetch = firebase.firestore()
            .collection('programingLanguages')
            .onSnapshot(processData)
        return fetch
    }, [])

    const processData = res => {
        let items = []
        res.forEach(each => {
            const { id, name } = each.data()
            items.push({ id, name, key: each.id })
        })
        setProgramingLanguages(items)
    }

    const deletePost = async () => {
        try {
            await firebase.firestore()
                .collection('posts').doc(key).delete()
            navigation.navigate('Home')
        } catch (error) {
        }
    }

    const confirmDelete = () => {
        Alert.alert(
            'Cảnh báo!!!',
            'Bạn có chắc không?',
            [
                { text: 'Có', onPress: deletePost },
                { text: 'Không', onPress: () => console.log('Ban da chon KHONG') }
            ],
            {
                cancelable: true,
                onDismiss: () => console.log('ONDISMISS')
            }
        )
    }

    const onRefresh = useCallback(async () => {
        setRefreshing(true)
        try {
            const res = await firebase.firestore()
                .collection('posts')
                .doc(key).get()
            if (res.exists) {
                const { id, title, body } = res.data()
                setPost({ id, title, body, key: res.id })
            }
        } catch (error) {
            console.log('>>>>>', error)
        }
        setRefreshing(false)
    }, [])

    const handleSignOut = () => {
        firebase.auth().signOut()
            .then(res => {
                navigation.navigate('Loading', { isLoggedIn: false })
            })
            .catch(err => console.log('>>>123', err))
    }

    const save = () => {
        setVisible(!visible)
    }

    const onSavePost = async () => {
        // // bat loi
        // if (tieuDe.trim().length == 0) {
        //     Alert()
        //     return
        // }
        // else if(noiDung.trim().length == 0){
            
        //     return
        // }
        try {
            await firebase.firestore()
            .collection('posts').doc(key)
            .set({
                title: tieuDe,
                body: noiDung
            })
            setPost({...post, title: tieuDe, body: noiDung})
            setVisible(false)
        } catch (error) {
            console.log('>>>>Cap nhat loi')
        }
    }

    if (!post) {
        return (<></>)
    }

    return (
        <>
            <View style={styles.buttons}>
                <Pressable onPress={confirmDelete}>
                    <MyText>Delete</MyText>
                </Pressable>
                <Pressable onPress={() => setVisible(true)}>
                    <MyText>Update</MyText>
                </Pressable>
            </View>            
            <ScrollView
                refreshControl={
                    <RefreshControl 
                        refreshing={refreshing}
                        onRefresh={onRefresh}
                    />
                }
                style={{padding: 30}}
            >
                <MyText>Title: {post.title}</MyText>
                <MyText>Body: {post.body}</MyText>
            </ScrollView>
            <Modal
                animationType='slide'
                transparent={true}
                visible={visible}
                onRequestClose={
                    () => {
                        Alert.alert('Bạn đã đóng modal')
                        setVisible(!visible)
                    }
                }
            >
                <View style={styles.modalContainer}>
                    <TextInput
                        value={tieuDe}
                        onChangeText={setTieuDe}
                        multiline={true}
                        numberOfLines={5}
                    />
                    <TextInput
                        value={noiDung}
                        onChangeText={setNoiDung}
                        multiline={true}
                        numberOfLines={5}
                    />
                    <View style={styles.buttons}>
                        <Pressable onPress={() => setVisible(false)}>
                            <MyText>Cancel</MyText>
                        </Pressable>
                        <Pressable onPress={onSavePost}>
                            <MyText>Save</MyText>
                        </Pressable>
                    </View>                    
                </View>                
            </Modal>
        </>
        // <View>

        //     <Pressable style={{ backgroundColor: 'blue' }} onPress={() => setVisible(true)}>
        //         <Text style={{ fontSize: 30 }}>Show modal</Text>
        //     </Pressable>

        //     <Modal
        //         animationType='slide'
        //         transparent={true}
        //         visible={visible}
        //         onRequestClose={
        //             () => {
        //                 Alert.alert('Bạn đã đóng modal')
        //                 setVisible(!visible)
        //             }
        //         }
        //     >
        //         <View
        //             style={{
        //                 backgroundColor: 'white',
        //                 margin: 20,
        //                 padding: 15,
        //                 borderRadius: 20,
        //                 height: 400,
        //                 shadowColor: "#000",
        //                 shadowOffset: {
        //                     width: 0,
        //                     height: 2
        //                 },
        //                 shadowOpacity: 0.25,
        //                 shadowRadius: 4,
        //                 elevation: 5
        //             }}
        //         >

        //             <TextInput
        //                 placeholder='Tiêu đề'
        //                 value={tieuDe}
        //                 onChangeText={setTieuDe}
        //             />
        //             <TextInput
        //                 placeholder='Nội dung'
        //                 value={noiDung}
        //                 onChangeText={setNoiDung}
        //             />

        //             <Picker
        //                 selectedValue={selectedLanguage}
        //                 onValueChange={(itemValue, itemIndex) => setSelectedLanguage(itemValue)}>
        //                 {
        //                     programingLanguages.map(item =>
        //                         <Picker.Item key={item.key} label={item.name} value={item.id} />
        //                     )
        //                 }
        //             </Picker>

        //             <Button title="Show Date Picker" onPress={showDatePicker} />
        //             <DateTimePickerModal
        //                 isVisible={isDatePickerVisible}
        //                 mode="date"
        //                 onConfirm={handleConfirm}
        //                 onCancel={hideDatePicker}
        //             />


        //             <Pressable onPress={save}>
        //                 <Text style={{ fontSize: 30 }}>Lưu</Text>
        //             </Pressable>

        //             <ActivityIndicator
        //                 size='large'
        //                 color='#000'
        //                 animating={isLoading}
        //                 hidesWhenStopped={true}
        //             />

        //             <Text style={{ fontSize: 30 }}
        //                 onPress={() => setVisible(!visible)}>Đóng modal</Text>
        //         </View>

        //     </Modal>

        //     <Text>Tieu de: {tieuDe}</Text>
        //     <Text>Noi dung: {noiDung}</Text>
        //     <Text>Select: {selectedLanguage}</Text>
        //     {/* <Text>Ngay thang: {date.toString()}</Text> */}

        // </View>


    )
}


export default Details

const styles = StyleSheet.create({
    buttons:{
        flexDirection: 'row',
        backgroundColor: 'gray',
        margin: 20,
        padding: 10,
        justifyContent: 'space-between'
    },
    buttonDelete:{
        // marginRight: 
    },
    buttonUpdate:{
        // marginLeft: 'auto'
    },
    modalContainer: {
        backgroundColor: 'white',
        margin: 20,
        padding: 15,
        borderRadius: 20,
        height: '90%',
        shadowColor: "#000",
        shadowOffset: {
            width: 0,
            height: 2
        },
        shadowOpacity: 0.25,
        shadowRadius: 4,
        elevation: 5
    }
})


