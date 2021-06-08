
import React, { useState, useEffect } from 'react'
import { StyleSheet, Platform, Image, Text, TextInput, View, Button } from 'react-native'
import firebase from '../utilities/firebaseDB'



const SignUp = props => {

    const { navigation, setIsAuth } = props
    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')
    const [err, setErr] = useState(null)

    const handleSignUp = () => {
        firebase.auth()
            .createUserWithEmailAndPassword(email, password)
            .then(() => {
                setIsAuth(true) 
                navigation.navigate('Loading')
            })
            .catch(error => setErr(error.message))
    }

    return (
        <View>
            <TextInput 
                placeholder='Email'
                value={email}
                onChangeText={setEmail}
            />
            <TextInput 
                secureTextEntry
                placeholder='Password'
                value={password}
                onChangeText={setPassword}
            />
            <Button title='Sign Up' onPress={handleSignUp}/>
            <Button title='Sign In' onPress={() => navigation.navigate('Login', {setIsAuth: setIsAuth})}/>
            {
                err && <Text style={{color: 'red', fontSize: 30}}>{err}</Text>
            }
        
        </View>
    )

}

export default SignUp