

import React, { useState, useEffect } from 'react'
import { StyleSheet, FlatList, Platform, Image, Pressable, Text, View } from 'react-native'
import firebase from '../utilities/firebaseDB'

const Details = props => {
    const {navigation, route:{params:{key}}} = props
    const [post, setPost] = useState(null)

    useEffect( async () => {
        const res = await firebase.firestore()
                    .collection('posts')
                    .doc(key).get()
        if (res.exists) {
            const {id, title, body} = res.data()
            setPost({id, title, body, key: res.id})
        }
        return res
    }, [])

    const deletePost = async () => {
        try {
            await firebase.firestore()
            .collection('posts').doc(key).delete()
            navigation.navigate('Home')
        } catch (error) {            
        }
    }

    if(!post){
        return(<></>)
    }
    console.log('>>>>>', post)
    return(
        <View>
            <Text style={{fontSize: 30}}>Title: {post.title}</Text>
            <Text style={{fontSize: 30}}>Body: {new Date(post.body.toDate()).toDateString()}</Text>
            <Pressable onPress={deletePost}><Text>Delete</Text></Pressable>
        </View>
        
    )
}


export default Details

