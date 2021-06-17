import React, {useState, useEffect} from 'react'
import { TextInput, View, Pressable, Text } from 'react-native'
import firebase from '../database/fbConfig'


const SignUp = props => {
    const { navigation } = props
    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')

    const onSignUp = () => {
        firebase.auth().createUserWithEmailAndPassword(email, password)
        .then(res => navigation.navigate('Loading', {isLoggedIn: true}))
        .catch(err => {})
    }

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
            <Pressable onPress={onSignUp}>
                <Text>Sign up</Text>
            </Pressable>
        </View>
    )
}

export default SignUp