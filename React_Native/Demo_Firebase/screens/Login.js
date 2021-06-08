
import React, { useState, useEffect } from 'react'
import { StyleSheet, TextInput, Platform, Image, Text, View, Pressable } from 'react-native'

import firebase from '../utilities/firebaseDB'

const Login = props => {
    const {navigation, route:{params: {setIsAuth}}} = props
    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')
    const [errMsg, setErrMsg] = useState(null)

    const handleLogin = () => {
        firebase.auth()
        .signInWithEmailAndPassword(email, password)
        .then(res => {
            setIsAuth(true)
            navigation.navigate('Loading')
        })
        .catch(err => setErrMsg('Login failed'))
    }

    return(
        <View>
            <TextInput 
                placeholder='Email'
                value={email}
                onChangeText={setEmail}
            />
            <TextInput
                placeholder='Password'
                value={password}
                onChangeText={setPassword}
                secureTextEntry
            />
            <Pressable onPress={handleLogin}>
                <Text>Sign in</Text>
            </Pressable>
            {
                errMsg && <Text style={{color: 'red', fontSize: 30}}>{errMsg}</Text>
            }
        </View>
    )
}

export default Login