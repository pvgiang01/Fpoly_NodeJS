
import React, { useState, useEffect } from 'react'
import {
    FlatList, Pressable,
    Text, View, ActivityIndicator, StyleSheet, Modal, TextInput, Alert
} from 'react-native'

import MyText from '../components/MyText'
import firebase from '../utilities/firebaseDB'



const Home = props => {
    const { navigation } = props
    const [visible, setVisible] = useState(false)
    const [user, setUser] = useState(null)
    const [data, setData] = useState([])

    const [tieuDe, setTieuDe] = useState('')
    const [noiDung, setNoiDung] = useState('')

    useEffect(() => {
        const { currentUser } = firebase.auth()
        setUser(currentUser)
    }, [])

    useEffect(() => {
        const fetch = firebase.firestore()
            .collection('posts')
            .onSnapshot(processData)
        return fetch
    }, [])

    const processData = res => {
        let items = []
        res.forEach(each => {
            const { id, title, body } = each.data()
            items.push({ id, title, body, key: each.id })
        })
        setData(items)
    }

    const renderItem = ({ item }) => (
        <View style={{ backgroundColor: 'red', marginBottom: 20 }}>
            <Pressable onPress={() => navigation.navigate('Details', { key: item.key })}>
                <MyText>{item.title}</MyText>
                <MyText>{item.body}</MyText>
            </Pressable>
        </View>
    )

    const onSavePost = () => {
        firebase.firestore()
        .collection('posts')
        .add({title: tieuDe, body: noiDung})
        .then(item => {
            console.log('Them moi thanh cong', item)
            setVisible(false)
        })
        .catch(err => console.log('Them moi error'))       
    }

    if (data.length == 0) {
        return (<><ActivityIndicator /></>)
    }    

    return (
        <>
            <View style={styles.buttons}>
                <Pressable onPress={() => setVisible(true)}>
                    <MyText>Add new</MyText>
                </Pressable>
            </View>

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

            <FlatList
                data={data}
                renderItem={renderItem}
                keyExtractor={item => item.key}
            />
        </>
    )
}

export default Home


const styles = StyleSheet.create({
    buttons: {
        flexDirection: 'row',
        backgroundColor: 'gray',
        margin: 20,
        padding: 10,
        justifyContent: 'space-between'
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