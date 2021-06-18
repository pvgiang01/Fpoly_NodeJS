import React, {useState, useEffect} from 'react'
import firebase from '../database/fbConfig'
import { TextInput, View, Pressable, Image, Text, FlatList } from 'react-native'


const Update = props => {
    const {navigation, route:{params}} = props
    const [image, setImage] = useState(null)
    const [title, setTitle] = useState('')
    const [body, setBody] = useState('')

    useEffect(async () => {
        const res = await firebase.firestore().collection('posts').doc(params.key).get()
        if(res.exists){
            const {avatar, body, title} = res.data()  
            setTitle(title)
            setBody(body)
            setImage({uri: avatar})      
        }
        return res
    }, [])  

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
                setImage(source)                
            }
        });
    }

    const uploadImageAsync = async () => {
        if(!image) return
        const { uri, fileName } = image
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

        let urlHinhAnh = await snapshot.ref.getDownloadURL()
        return urlHinhAnh
    }

    const onSave = async () => {
        try {
            const url = await uploadImageAsync()
            firebase.firestore().collection('posts')
            .add({title, body, avatar: url})
            .then(res => navigation.navigate('Home'))
            .catch()
        } catch (error) {
            
        }        
    }

    return (
        <View>
            <TextInput
            value={title}
            onChangeText={setTitle}
            />
            <TextInput
                value={body}
                onChangeText={setBody}
            />
            <Image 
                style={{width:100, height: 100}}
                source={{uri: image?.uri}}
            />
            <Pressable onPress={onTakePhoto}><Text>Take photo</Text></Pressable>
            <Pressable onPress={onSave}><Text>Save</Text></Pressable>
        </View>
    )

}


export default Update