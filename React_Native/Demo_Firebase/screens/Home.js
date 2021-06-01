
import React, { useState, useEffect } from 'react'
import { StyleSheet, Platform, Image, Text, View } from 'react-native'
import firebase from '../utilities/firebaseDB'



const Home = props => {

    const [user, setUser] = useState(null)
    useEffect(() => {
        const {currentUser} = firebase.auth()
        setUser(currentUser)
    }, [])

    if(!user) {
        return (<></>)
    }
    return(
        <View>
            <Text>{user.email}</Text>
        </View>
    )
}

export default Home
