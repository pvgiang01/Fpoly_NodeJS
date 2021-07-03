import React, {useState} from 'react'
import {Text, View, StyleSheet, Button} from 'react-native';

const PhepCong = props => {   
    const {a, b} = props
    return (
        <>
            <Text style={styles.text}>{a} + {b}</Text>            
        </>
    )
}

export default PhepCong

const styles = StyleSheet.create({
    text:{
        fontSize: 40
    }
})