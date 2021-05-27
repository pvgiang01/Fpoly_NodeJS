

import React, {useState} from 'react'
import { Text, View, Button, StyleSheet, FlatList, Image } from 'react-native'

const Detail = props => {
    const {route: {params}} = props
    const {avatar} = params
    return(
        <>  
            <View>
                <Text style={styles.text}>{params.id}</Text>
                <Text style={styles.text}>{params.title}</Text>
                <Image 
                    style={styles.img}
                    source={avatar}
                />
            </View>
        </>
    )
}

export default Detail

const styles = StyleSheet.create({
    text:{
        backgroundColor: '#f9c2ff',
        padding: 20,
        marginVertical: 8,
        marginHorizontal: 16,
        fontSize: 32
    },
    img: {
        width: 100,
        height: 100,
        resizeMode: 'cover'
    }
})