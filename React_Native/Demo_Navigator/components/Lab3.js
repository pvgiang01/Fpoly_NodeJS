


import React, {useState} from 'react'
import {Text, StyleSheet, Alert} from 'react-native'


const Lab3 = () => {
    // get, set
    const [content, setContent] = useState('')
    const login = () => {
        setContent('Login success') 
    }
    const signup = () => {
        setContent('Signup success') 
    }
    return (
        <>
            <Text style={styles.text}>Welcome</Text>
            <Text style={[styles.text, styles.login]}
                 onPress={login}>Login</Text>
            <Text style={styles.text} onPress={signup}>Sign up</Text>
            <Text style={styles.text}>{content}</Text>            
        </>
    )
}


export default Lab3

const styles = StyleSheet.create({
    text: {
        fontSize: 30
    },
    login:{
        backgroundColor: 'red',
        color: 'white',
        textAlign:'center',
        margin: 20,
        borderRadius: 20
    }
})