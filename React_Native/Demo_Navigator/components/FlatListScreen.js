
import * as React from 'react'
import {View, FlatList, Text, StyleSheet } from 'react-native'

const data = [
    {id: 1, name: 'Nguyễn Văn Anh'},
    {id: 2, name: 'Nguyễn Văn Anh'},
    {id: 3, name: 'Nguyễn Văn Anh'},
    {id: 4, name: 'Nguyễn Văn Anh'},
    {id: 5, name: 'Nguyễn Văn Anh'},
    {id: 6, name: 'Nguyễn Văn Anh'},
    {id: 7, name: 'Nguyễn Văn Anh'},
    {id: 8, name: 'Nguyễn Văn Anh'},
    {id: 9, name: 'Nguyễn Văn Anh'},
    {id: 10, name: 'Nguyễn Văn Anh'},
    {id: 11, name: 'Nguyễn Văn Anh'},
    {id: 12, name: 'Nguyễn Văn Anh'},
    {id: 13, name: 'Nguyễn Văn Anh'},
    {id: 14, name: 'Nguyễn Văn Anh'}
]

const renderItem = (props) => {
    const {item: {name}} = props
    console.log(props)
    return (
        <View>
            <Text>{name}</Text>
        </View>
    )    
}

const MyFlatList = () => {
    return (
        <FlatList
            data={data}
            renderItem={renderItem}
            keyExtractor={item => item.id}
        />
    )
}

export default MyFlatList