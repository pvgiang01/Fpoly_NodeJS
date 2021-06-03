

import React, { useState, useEffect } from 'react'
import {
    StyleSheet, FlatList, Platform, Modal,
    Image, Pressable, Text, View, Alert,
    TextInput, ActivityIndicator
} from 'react-native'
import firebase from '../utilities/firebaseDB'

const Details = props => {
    const { navigation, route: { params: { key } } } = props
    const [post, setPost] = useState(null)
    const [visible, setVisible] = useState(false)

    const [tieuDe, setTieuDe] = useState('')
    const [noiDung, setNoiDung] = useState('')
    const [isLoading, setIsLoading] = useState(false)

    useEffect(async () => {
        const res = await firebase.firestore()
            .collection('posts')
            .doc(key).get()
        if (res.exists) {
            const { id, title, body } = res.data()
            setPost({ id, title, body, key: res.id })
        }
        return res
    }, [key])

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
                {text: 'Có', onPress: deletePost},
                {text: 'Không', onPress: () => console.log('Ban da chon KHONG')}
            ],
            {
                cancelable: true,
                onDismiss: () => console.log('ONDISMISS')
            }
        )
    }

    if (!post) {
        return (<></>)
    }

    return (
        <View>
            <Text style={{ fontSize: 30 }}>Title: {post.title}</Text>
            <Text style={{ fontSize: 30 }}>Body: {post.body}</Text>

            <Pressable onPress={confirmDelete}>
                <Text style={{fontSize: 30}}>Delete</Text>
            </Pressable>

            <Pressable style={{backgroundColor:'blue'}} onPress={() => setVisible(true)}>
                <Text style={{fontSize: 30}}>Show modal</Text>
            </Pressable>

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
                <View 
                    style={{
                        backgroundColor:'white',
                        margin: 20,
                        padding: 15,
                        borderRadius: 20,
                        height: 300,
                        shadowColor: "#000",
                        shadowOffset: {
                          width: 0,
                          height: 2
                        },
                        shadowOpacity: 0.25,
                        shadowRadius: 4,
                        elevation: 5
                    }}
                >

                    <TextInput 
                        placeholder='Tiêu đề'
                        value={tieuDe}
                        onChangeText={setTieuDe}
                    />
                    <TextInput 
                        placeholder='Nội dung'
                        value={noiDung}
                        onChangeText={setNoiDung}
                    />
                    <Pressable 
                        onPress={() => Alert.alert(tieuDe + '  ' + noiDung)}
                    >
                        <Text style={{fontSize: 30}}>Lưu</Text>
                    </Pressable>
                    <ActivityIndicator
                        size='large'
                        color='#000'
                        animating={isLoading}
                        hidesWhenStopped={true}
                    />

                    <Text style={{fontSize: 30}} 
                        onPress={() => setVisible(!visible)}>Đóng modal</Text>
                </View>
                
            </Modal>
        </View>

    )
}


export default Details

