import React, { useEffect, useState } from 'react'
import { StyleSheet, Text, View, SafeAreaView, FlatList } from 'react-native'



const products = ({ navigation }) => {
    const [data, setData] = useState([])
    useEffect(() => {
        fetch('http://10.0.2.2:3000/api/products')
            .then((response) => response.json())
            .then((json) => setData(json))
            .catch((error) => console.error(error))
    }, [])

    const Item = ({ item, onPress }) => (
        <Text onPress={onPress}>{item.productName}</Text>
    );

    const renderItem = ({ item }) => {
        return (
            <Item item={item}
                onPress={() => navigation.navigate('Detail', { item })} />
        )
    }

    if (data.length == 0) {
        return <></>
    }

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
