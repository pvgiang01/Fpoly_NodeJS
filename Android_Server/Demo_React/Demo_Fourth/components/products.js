import React, { useState, useEffect } from 'react'
import {
    StyleSheet, Text, View,
    SafeAreaView, FlatList
} from 'react-native'


const Item = ({ item, navigation }) => {
    const onPress = (item) => {
        navigation.navigate('Detail', { item: item })
    }
    return (
        <View >
            <Text onPress={() => onPress(item)}>{item.productName}</Text>
        </View>
    )
}

const products = ({ navigation }) => {
    const [data, setData] = useState([])
    useEffect(() => {
        fetch('http://10.0.2.2:3000/api/products')
            .then((response) => response.json())
            .then((json) => setData(json))
            .catch((error) => console.error('>>>>>>>', error));
    }, [])

    const renderItem = ({ item }) => (
        <Item item={item} navigation={navigation} />
    )

    return (
        <SafeAreaView>
            <FlatList
                data={data}
                renderItem={renderItem}
                keyExtractor={(item) => item._id}
            />
        </SafeAreaView>
    )
}

export default products

const styles = StyleSheet.create({})
