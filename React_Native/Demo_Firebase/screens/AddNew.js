



import React, { useState, useEffect, useCallback } from 'react'
import {
    Modal, ScrollView, RefreshControl,
    Pressable, Text, View, Alert,
    TextInput, ActivityIndicator, Button, StyleSheet,
    Image
} from 'react-native'

import { launchCamera, launchImageLibrary } from 'react-native-image-picker'
import MyText from '../components/MyText'
import firebase from '../utilities/firebaseDB'



const AddNew = props => {
    const [tieuDe, setTieuDe] = useState(null)
    const [noiDung, setNoiDung] = useState(null)
    const [hinhAnh, setHinhAnh] = useState(null)

    const validation = () => {
        if (!tieuDe || tieuDe.trim().length < 10) {
            Alert.alert(
                'Cảnh báo!!!',
                'Tieu de khong dung?',
                [
                    { text: 'Hieu roi', onPress: () => {} },
                    { text: 'Không', onPress: () => {} }
                ],
                {
                    cancelable: true,
                    onDismiss: () => console.log('ONDISMISS')
                }
            )
            return
        } else if(!noiDung || noiDung.trim().length < 100) {
            Alert.alert(
                'Cảnh báo!!!',
                'Tieu de khong dung?',
                [
                    { text: 'Hieu roi', onPress: () => {} },
                    { text: 'Không', onPress: () => {} }
                ],
                {
                    cancelable: true,
                    onDismiss: () => console.log('ONDISMISS')
                }
            )
            return
        }
    }
    const onSavePost = async () => {
        validation()
        try {
            const url = await uploadImageAsync()
            firebase.firestore()
            .collection('posts')
            .add({title: tieuDe, body: noiDung, avatar: url})
            .then(item => {
                console.log('Them moi thanh cong', item)
            })
            .catch(err => console.log('Them moi error'))
        } catch (error) {
            console.log(error)
        }  
    }

    const onTakePhoto = () => {
        var options = {
            maxHeight: 250,
            maxWidth: 350,
            saveToPhotos: true
        }

        launchCamera(options, res => {
            console.log('Response = ', res)
            if (res.didCancel) {
                console.log('User cancelled image picker');
            } else if (res.error) {
                console.log('ImagePicker Error: ', res.error);
            } else if (res.customButton) {
                console.log('User tapped custom button: ', res.customButton);
                alert(res.customButton);
            } else {
                let source = res.assets[0];
                setHinhAnh(source)                
            }
        });
    }

    const uploadImageAsync = async () => {
        if(!hinhAnh) return
        const { uri, fileName } = hinhAnh
        const ref = firebase
            .storage()
            .ref()
            .child(fileName)

        const blob = await new Promise((resolve, reject) => {
            const xhr = new XMLHttpRequest();
            xhr.onload = function () {
                resolve(xhr.response);
            };
            xhr.onerror = function () {
                reject(new TypeError("Network request failed"));
            };
            xhr.responseType = "blob";
            xhr.open("GET", uri, true);
            xhr.send(null);
        });

        var mimeString = uri.split(":")[1]
        const snapshot = await ref.put(blob, { contentType: mimeString })

        let urlHinhAnh = await snapshot.ref.getDownloadURL();
        console.log('>>>>', urlHinhAnh)
        return urlHinhAnh
    }

    return (
        <View>
            <TextInput
                value={tieuDe}
                onChangeText={setTieuDe}
            />
            <TextInput
                value={noiDung}
                onChangeText={setNoiDung}
            />
            <View>
                <Image
                    source={{ uri: hinhAnh?.uri }}
                    style={{ width: 200, height: 200, resizeMode: 'cover' }}
                />
                <Pressable onPress={onTakePhoto}>
                    <MyText>Take photo</MyText>
                </Pressable>
            </View>
            <View>
                <Pressable onPress={onSavePost}>
                    <MyText>Save</MyText>
                </Pressable>
            </View>
        </View>
    )
}


export default AddNew


