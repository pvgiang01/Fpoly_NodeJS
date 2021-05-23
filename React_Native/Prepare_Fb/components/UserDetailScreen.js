// screens/UserDetailScreen.js

import React, { useState, useEffect } from 'react';
import { Alert, Button, View, Text, TextInput } from 'react-native';
import firebase from '../helper/firebaseDB';


const UserDetailScreen = props => {
    const { navigation: { navigate }, route: { params: { key } } } = props
    const [post, setPost] = useState(null)
    
    useEffect(async () => {
        const res = await firebase.firestore().collection('posts').doc(key).get()
        if(res.exists){
            const { id, title, body } = res.data();
            setPost({key: res.id, id, title, body})
        }
        return res
    }, [])

    const remove = async () => {
        try {
            await firebase.firestore()
            .collection('posts').doc(post.key).delete()
            navigate('UserScreen')
        } catch (error) {
            console.log('>>>>>>>>>17', error)
        }
    }

    const update = async () => {
        try {
            await firebase.firestore()
            .collection('posts').doc(post.key)
            .set({
                title: post.title,
                body: post.body
            })
            navigate('UserScreen')
        } catch (error) {
            console.log('>>>>>>>>>28', error)
        }       
    }
    const openTwoButtonAlert=()=>{
        Alert.alert(
          'Delete User',
          'Are you sure?',
          [
            {text: 'Yes', onPress: remove},
            {text: 'No', onPress: () => console.log('No item was removed'), style: 'cancel'},
          ],
          { 
            cancelable: true 
          }
        );
      }
    if (!post) {
        return (
            <View></View>
        )
    }
    return (
        <>
            <View>
                <TextInput
                    placeholder={'Title'}
                    value={post.title}
                    onChangeText={(val) => setPost({...post, title: val})}
                />
            </View>
            <View>
                <TextInput
                    multiline={true}
                    numberOfLines={4}
                    placeholder={'Body'}
                    value={post.body}
                    onChangeText={(val) => setPost({...post, body: val})}
                />
            </View>
            <View>
                <Button
                    title="Update"
                    onPress={update}
                    color="#19AC52"
                />
            </View>
            <View >

                <Button
                    title="Remove"
                    onPress={openTwoButtonAlert}
                    color="#19AC52"
                />
            </View>
        </>

    )
}


export default UserDetailScreen;