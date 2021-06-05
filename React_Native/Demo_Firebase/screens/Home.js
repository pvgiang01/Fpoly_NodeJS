
import React, { useState, useEffect } from 'react'
import { StyleSheet, FlatList, Pressable,
     Platform, Image, Text, View, ActivityIndicator } from 'react-native'
import firebase from '../utilities/firebaseDB'



const Home = props => {
    const {navigation} = props

    const [user, setUser] = useState(null)
    const [data, setData] = useState([])

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

    if (data.length == 0) {
        return (<><ActivityIndicator /></>)
    }


    
    const renderItem = ({ item }) => (        
        <View style={{backgroundColor: 'red', marginBottom: 20}}>
            <Pressable onPress={() => navigation.navigate('Details', {key: item.key})}>
                <Text>{item.title}</Text>
                <Text>{item.body}</Text>
            </Pressable>
        </View>
    )

    return (
        <FlatList
            data={data}
            renderItem={renderItem}
            keyExtractor={item => item.key}
        />
    )
}

export default Home
