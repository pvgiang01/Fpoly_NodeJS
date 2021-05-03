import React from 'react'
import { StyleSheet, Text, View, Image } from 'react-native'

const detail = ({ navigation, route }) => {
    let {item: product} = route.params
    return (
        <View>
            <Text>{product.productName}</Text>
            <Text>{product.price}</Text>
            <Image
                style={{
                    width: 166,
                    height: 158,
                    resizeMode: 'cover',
                }}
                source={{ uri: 'http://10.0.2.2:3000/images/' + product.img }} />
        </View>
    )
}

export default detail

const styles = StyleSheet.create({})
