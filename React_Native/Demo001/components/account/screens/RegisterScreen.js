import React, {useState, useContext} from 'react';
import { Text, View, StyleSheet, Pressable, TextInput } from 'react-native';

import { AccountContext } from '../AccountContext';

export const RegisterScreen = props => {
    const {onRegister} = useContext(AccountContext)
    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')
    const [confirmPassword, setconfirmPassword] = useState('')

    const handleSignUp = () => {
        if (password === confirmPassword) {
            onRegister(email, password)
        } else {
            // bat thong bao 
        }      
    }

    return (
        <>
            <View style={{alignItems:'center'}}>
                <Text style={styles.text}>Register Screen</Text>
                <TextInput 
                    style={styles.input}
                    value={email}
                    onChangeText={setEmail}
                />
                <TextInput 
                    style={styles.input}
                    value={password}
                    onChangeText={setPassword}
                    secureTextEntry={true}
                />
                <TextInput 
                    style={styles.input}
                    value={confirmPassword}
                    onChangeText={setconfirmPassword}
                    secureTextEntry={true}
                />
                <Pressable style={styles.button} onPress={handleSignUp} >
                    <Text style={[styles.text, {color: 'white'}]}>Sign Up</Text>
                </Pressable>
            </View>
            
        </>
    )
}

const styles = StyleSheet.create({
    button:{
        width: 200,
        height: 50,
        backgroundColor: 'blue',
        alignItems: 'center',
        color: 'white'
    },
    input: {
        width: '90%',
        height: 50,
        fontSize: 30,
        backgroundColor: 'grey',
        color: 'white',
        margin: 16
    },
    text:{
        fontSize: 40
    }
})