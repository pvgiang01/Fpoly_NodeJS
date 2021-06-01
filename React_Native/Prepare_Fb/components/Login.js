import React, { useState, useEffect } from 'react'
import { StyleSheet, Text, TextInput, View, Button } from 'react-native'
import firebase from '../helper/firebaseDB';



const Login = props => {

    const { navigation } = props
    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')
    const [error, setError] = useState(null)

    const handleLogin = () => {

        firebase
            .auth()
            .signInWithEmailAndPassword(email, password)
            .then(() => navigation.navigate('Main'))
            .catch(error => setError(error.message))
    }

    return (
        <View style={styles.container}>
            <Text>Login</Text>
            {error &&
                <Text style={{ color: 'red' }}>
                    {error}
                </Text>}
            <TextInput
                style={styles.textInput}
                autoCapitalize="none"
                placeholder="Email"
                onChangeText={setEmail}
                value={email}
            />
            <TextInput
                secureTextEntry
                style={styles.textInput}
                autoCapitalize="none"
                placeholder="Password"
                onChangeText={setPassword}
                value={password}
            />
            <Button title="Login" onPress={handleLogin} />
            <Button
                title="Don't have an account? Sign Up"
                onPress={() => navigation.navigate('SignUp')}
            />
        </View>
    )

}

export default Login

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center'
    },
    textInput: {
        height: 40,
        width: '90%',
        borderColor: 'gray',
        borderWidth: 1,
        marginTop: 8
    }
})