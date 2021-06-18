import React, {useState, useEffect} from 'react'
import firebase from '../database/fbConfig'
import { TextInput, View, Pressable, Image, Text, FlatList } from 'react-native'


const Detail = props => {
    const {navigation, route:{params}} = props
    const [post, setPost] = useState(null)
    useEffect(async () => {
        const res = await firebase.firestore().collection('posts').doc(params.key).get()
        if(res.exists){
            const {avatar, body, title} = res.data()
            setPost({title, body, avatar, key: res.id})
        }
        return res
    }, [])

    const onDelete = async () => {
        try {
            await firebase.firestore().collection('posts').doc(params.key).delete()
            navigation.navigate('Home')
        } catch (error) {
            
        }
    }

    return (
        <View>
                <Image 
                    style={{width: 200, height: 200}}
                    source={{uri: post.avatar}}
                />
                <Text>{post.title}</Text>
                <Text>{post.body}</Text>
                <Pressable onPress={onDelete}>
                    <Text>Delete</Text>
                </Pressable>
        </View>
    )

}


export default Detail