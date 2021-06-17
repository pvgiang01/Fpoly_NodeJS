

import React, {useState, useEffect} from 'react'
import { TextInput, View, Pressable, Text } from 'react-native'
import firebase from '../database/fbConfig'


const Login = props => {
    const { navigation } = props
    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')

    const onLogin = () => {
        firebase.auth().signInWithEmailAndPassword(email, password)
        .then(res => navigation.navigate('Loading', {isLoggedIn: true}))
        .catch(err => {})
    }

    const onGoSignUp = () => navigation.navigate('SignUp')

    return(
        <View>
            <TextInput
                value={email}
                onChangeText={setEmail}
            />
            <TextInput
                value={password}
                onChangeText={setPassword}
                secureTextEntry
            />
            <Pressable onPress={onLogin}>
                <Text>Login</Text>
            </Pressable>
            <Pressable onPress={onGoSignUp}>
                <Text>Sign up</Text>
            </Pressable>
        </View>
    )
}

export default Login