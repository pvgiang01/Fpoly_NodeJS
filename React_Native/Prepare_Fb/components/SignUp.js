import React, {useState, useEffect} from 'react'
import { StyleSheet, Text, TextInput, View, Button } from 'react-native'
import firebase from '../helper/firebaseDB';



const SignUp = props => {

    const {navigation} = props
    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')
    const [error, setError] = useState(null)

    const handleSignUp = () => {
        firebase
            .auth()
            .createUserWithEmailAndPassword(email, password)
            .then(() => navigation.navigate('Main'))
            .catch(error => setError(error.message))
    }

        return (
            <View style={styles.container}>
                <Text>Sign Up</Text>
                {error &&
                    <Text style={{ color: 'red' }}>
                        {error}
                    </Text>}
                <TextInput
                    placeholder="Email"
                    autoCapitalize="none"
                    style={styles.textInput}
                    onChangeText={setEmail}
                    value={email}
                />
                <TextInput
                    secureTextEntry
                    placeholder="Password"
                    autoCapitalize="none"
                    style={styles.textInput}
                    onChangeText={setPassword}
                    value={password}
                />
                <Button title="Sign Up" onPress={handleSignUp} />
                <Button
                    title="Already have an account? Login"
                    onPress={() => navigation.navigate('Login')}
                />
            </View>
        )
    
}

export default SignUp


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