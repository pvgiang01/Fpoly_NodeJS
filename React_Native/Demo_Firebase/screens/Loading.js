
import React, { useState, useEffect } from 'react'
import { StyleSheet, Platform, Image, Text, View, ActivityIndicator } from 'react-native'
import firebase from '../utilities/firebaseDB'

import Home from './Home'
import SignUp from './SignUp'



const Loading = props => {
    const { navigation } = props
    const [isAuth, setIsAuth] = useState(false)
    useEffect(() => {
        const subs = firebase.auth()
            .onAuthStateChanged(user => {
                if (user) {
                    setIsAuth(true)
                }
            })
        return subs
    }, [isAuth])


    if (isAuth) {
        return <Home />
    } else {
        return <SignUp {...navigation} />
    }

}

export default Loading