



import React, {useState} from 'react'
import {Text, StyleSheet, Alert, Image} from 'react-native'




const ImageScreen = () => {
    const data = [{uri:'../images/008.jpg'}] 
    const uri = data[0].uri
    return (
        <>
            <Image
                style={styles.image}
                source={{
                    uri:'https://giaxeoto.vn/admin/webroot/img/upload2/lamborghini-aventador-gia-bao-nhieu.jpg'
                }} 
            />
            <Image
                style={styles.image}
                source={require('../images/008.jpg')} 
            />
        </>
    )
}


export default ImageScreen

const styles = StyleSheet.create({
    image: {
        width: 400,
        height: 400,
        resizeMode: 'cover'
    }
})