import React, {useState} from 'react'
import {Text, View, StyleSheet, Button} from 'react-native';

const KetQua = props => {   
    const {a, b} = props
    return (
        <>
            <Text style={styles.text}>=</Text>            
            <Text style={styles.text}>{a + b}</Text>            
        </>
    )
}

export default KetQua

const styles = StyleSheet.create({
    text:{
        fontSize: 40
    }
})