import React, {useState} from 'react'
import {Text, View, StyleSheet, Button} from 'react-native';

const PhepTinh = props => {   
    const {name, onChangeName} = props
    return (
        <>
            <Text style={styles.text}>Tên từ component cha: {name}</Text>
            <Button title={'Đổi tên ở component Con'} 
                onPress={() => onChangeName('Lý Tiểu Long')}/>
        </>
    )
}

export default PhepTinh

const styles = StyleSheet.create({
    text:{
        fontSize: 40
    }
})