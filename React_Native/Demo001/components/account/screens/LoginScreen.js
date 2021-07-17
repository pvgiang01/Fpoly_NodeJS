import React, {useState, useContext} from 'react';
import { Text, View, StyleSheet, Pressable } from 'react-native';


export const LoginScreen = props => {
    return (
        <>
            <Text style={styles.text}>Login Screen</Text>
        </>
    )
}

const styles = StyleSheet.create({
    text:{
        fontSize: 40
    }
})