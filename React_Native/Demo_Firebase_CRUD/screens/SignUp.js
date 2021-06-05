import React, { useState, useEffect } from 'react'
import {ActivityIndicator, View, FlatList, 
    Pressable, Text, TextInput} from 'react-native'

import firebase from '../database/config'


const SignUp = props => {
    const {navigation} = props
    const [email, setEmail] = useState(null)
    const [pass, setPass] = useState(null)
    const [errMsg, setErrMsg] = useState(null)

    const onPressSignUp = () => {
        firebase.auth()
        .createUserWithEmailAndPassword(email, pass)
        .then(() => navigation.navigate('Home'))
        .catch(error => setErrMsg(error.message))
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
                value={pass}
                onChangeText={setPass}
                secureTextEntry
            />
            <Pressable onPress={onPressSignUp}>
                <Text>Sign up</Text>
            </Pressable>
            {errMsg && <Text>{errMsg}</Text>}
        </View>
    )
}

export default SignUp