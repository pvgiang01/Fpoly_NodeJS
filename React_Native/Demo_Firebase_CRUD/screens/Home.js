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
    const [img, setImg] = useState(null)

    useEffect(() => {
        // select * from posts
        firebase.firestore().collection('posts')
            .onSnapshot(results => {
                let posts = []
                results.forEach(element => {
                    const { title, body, avatar } = element.data()
                    posts.push({ title, body, avatar, key: element.id })
                })
                setData(posts)
            })
    }, [])

    const renderItem = props => {
        const { item } = props
        return (
            <View style={{ backgroundColor: 'grey', marginBottom: 20 }}>
                <Image
                        source={{ uri: item?.avatar }}
                        style={{ width: 200, height: 200 }}
                    />
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
            maxHeight: 250,
            maxWidth: 350,
            saveToPhotos: true
        };
    
        launchImageLibrary(options, res => {
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
    const uploadImageAsync = async () => {
        const { uri, fileName } = image
        const ref = firebase
          .storage()
          .ref()
          .child(fileName);
    
        const blob = await new Promise((resolve, reject) => {
          const xhr = new XMLHttpRequest();
          xhr.onload = function() {
            resolve(xhr.response);
          };
          xhr.onerror = function() {
            reject(new TypeError("Network request failed"));
          };
          xhr.responseType = "blob";
          xhr.open("GET", uri, true);
          xhr.send(null);
        });
    
        var mimeString = uri.split(":")[1]
    
        const snapshot = await ref.put(blob, { contentType: mimeString });
    
        let url = await snapshot.ref.getDownloadURL();
        console.log('>>>>', url)
        setImg(url)
        return url;
      }

      return (
          <View>
              <FlatList 
                data={data}
                renderItem={renderItem}
                keyExtractor={item => item.key}
              />
          </View>
      )

    // return (
    //     <View>
    //     <Image
    //         source={{ uri: image?.uri }}
    //         style={{ width: 200, height: 200 }}
    //     />
    //     {
    //         img &&  <Image
    //                     source={{ uri: img }}
    //                     style={{ width: 300, height: 300 }}
    //                 />
    //     }
    //     <Pressable onPress={selectFile}>
    //         <Text>Take photo</Text>
    //     </Pressable>
    //     <Pressable onPress={uploadImageAsync}>
    //         <Text>Save photo</Text>
    //     </Pressable>
    // </View>
    // )

}


export default Home