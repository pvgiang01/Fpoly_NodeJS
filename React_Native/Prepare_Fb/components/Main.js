// Main.js
import React, { useState, useEffect } from 'react'
import { StyleSheet, Platform, Image, Text, View } from 'react-native'
import firebase from '../helper/firebaseDB';
import { WebView } from 'react-native-webview';


const Main = props => {
    const [user, setUser] = useState(null)
    useEffect(() => {
        const { currentUser } = firebase.auth()
        setUser(currentUser)
    }, [])



    return (
        <>
        <View style={styles.container}>
            <Text>
                Hi {user && user.email}!
        </Text>
            
        </View>
        <WebView source={{ uri: 'https://reactnative.dev/' }} />
        </>
    )

}

export default Main

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center'
    }
})