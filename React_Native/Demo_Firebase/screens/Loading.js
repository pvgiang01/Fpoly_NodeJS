
import React, { useState, useEffect } from 'react'
import { StyleSheet, Platform, Image, Text, View, ActivityIndicator } from 'react-native'
import firebase from '../utilities/firebaseDB'

const Loading = props => {
    const {navigation} = props

    useEffect(() => {
        const subs = firebase.auth()
                        .onAuthStateChanged(user => {
                            console.log('>>>>>>>>', user)
                            const scr = user ? 'Home' : 'SignUp'
                            console.log('>>>>>>>>', scr)
                            navigation.navigate(scr)
                        })
        return subs
    }, [])

    return (
        <View>
            <Text>Loading</Text>
            <ActivityIndicator size='large'/>
        </View>
    )
}

export default Loading