import React from 'react'
import { StyleSheet, Text, View, Image } from 'react-native'

const detail = ({ navigation, route }) => {
    const { item: product } = route.params

    return (
        <View>
            <Text>{product.productName}</Text>
            <Image
                style={{
                    width: 66,
                    height: 58,
                    resizeMode: 'cover',
                }}
                source={{ uri: 'http://10.0.2.2:3000/images/' + product.img }} />
        </View>
    )
}

export default detail

const styles = StyleSheet.create({})

