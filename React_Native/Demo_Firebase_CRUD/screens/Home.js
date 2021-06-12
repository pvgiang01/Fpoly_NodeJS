import React, { useState, useEffect } from 'react'
import {
    ActivityIndicator, View, FlatList,
    Pressable, Text, Modal, TextInput, Image
} from 'react-native'
import {launchCamera, launchImageLibrary} from 'react-native-image-picker';

import firebase from '../database/config'

const Home = props => {
    const { navigation } = props
    const [data, setData] = useState([])
    const [title, setTitle] = useState(null)
    const [body, setBody] = useState(null)
    const [visible, setVisible] = useState(false)

    useEffect(() => {
        // select * from posts
        firebase.firestore().collection('posts')
            .onSnapshot(results => {
                let posts = []
                results.forEach(element => {
                    const { title, body } = element.data()
                    posts.push({ title, body, key: element.id })
                })
                setData(posts)
            })
    }, [])

    const renderItem = props => {
        const { item } = props
        return (
            <View style={{ backgroundColor: 'grey', marginBottom: 20 }}>
                <Pressable
                    onPress={() => navigation.navigate('Details', { key: item.key })}>
                    <Text>{item.title}</Text>
                </Pressable>
            </View>
        )
    }

    const onPressAddNew = () => setVisible(true)
    const onPressSave = () => {
        setVisible(false)
        firebase.firestore()
        .collection('posts')
        .add({title, body})
        .then(res => console.log(res))
        .catch(err => console.log(err))
        setBody(null)
        setTitle(null)
    }

    const [image, setImage] = useState(null)
    const selectFile = () => {
        var options = {
          includeBase64: true,
          saveToPhotos: true
        };
    
        launchCamera(options, res => {
          console.log('Response = ', res);
    
          if (res.didCancel) {
            console.log('User cancelled image picker');
          } else if (res.error) {
            console.log('ImagePicker Error: ', res.error);
          } else if (res.customButton) {
            console.log('User tapped custom button: ', res.customButton);
            alert(res.customButton);
          } else {
            let source = res.assets[0] ;
            setImage(source)
          }
        });
      };
    const saveFile = () => {
        const { uri, base64 } = image;
        const filename = uri.substring(uri.lastIndexOf('/') + 1);
        
        firebase.storage().ref().child(filename).putString(base64, 'base64')
        .then(res => console.log(res))
        .catch(err => console.log(err))
    }
    console.log('>>>',image)
    if (data.length === 0) {
        return (<><ActivityIndicator size='large' color='red' /></>)
    } else {
        return (
            <>
                <View>
                    <Image
                        source={{ uri: image?.uri }}
                        style={{ width: 200, height: 200 }}
                    />
                    <Pressable onPress={selectFile}>
                        <Text>Take photo</Text>
                    </Pressable>
                    <Pressable onPress={saveFile}>
                        <Text>Save photo</Text>
                    </Pressable>
                </View>
                {/* <View>
                    <FlatList
                        data={data}
                        renderItem={renderItem}
                        keyExtractor={item => item.key}
                    />
                </View> */}

                {/* <View>
                    <Pressable onPress={onPressAddNew}>
                        <Text>Add new</Text>
                    </Pressable>

                    <Modal
                        animationType='slide'
                        transparent={true}
                        visible={visible}
                        onRequestClose={() => setVisible(!visible)}
                    >
                        <View 
                            style={{
                                backgroundColor: 'white',
                                margin: 20,
                                padding: 15,
                                borderRadius: 20,
                                height: 400,
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
                                value={title}
                                onChangeText={setTitle}
                            />
                            <TextInput
                                placeholder='Nội dung'
                                multiline={true}
                                numberOfLines={10}
                                value={body}
                                onChangeText={setBody}                                
                            />
                            <Pressable onPress={onPressSave}>
                                <Text>Save</Text>
                            </Pressable>
                        </View>
                    </Modal>

                </View> */}
            </>
        )
    }
}


export default Home