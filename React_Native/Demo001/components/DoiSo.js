import React, {useState} from 'react'
import {Text, View, StyleSheet, Button} from 'react-native';

const DoiSo = props => {   
    const {onChangeNumber} = props
    const randomNumber = () => {
        let a = Math.floor(Math.random() * 9)
        let b = Math.floor(Math.random() * 9)
        onChangeNumber(a,b)
    }
    return (
        <>
            <Button title={'Đổi số'} onPress={randomNumber}/>
        </>
    )
}

export default DoiSo

const styles = StyleSheet.create({
    text:{
        fontSize: 40
    }
})