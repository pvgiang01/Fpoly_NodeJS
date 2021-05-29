

import React, {useState, useEffect} from 'react'
import {Text, Image, StyleSheet, View, FlatList} from 'react-native'




const FetchData = props => {
    const [data, setData] = useState([])
    const {navigation} = props
    useEffect(() => {
        fetch('https://60ae432680a61f0017332d65.mockapi.io/api/v1/comments')
        .then(res => res.json())
        .then(json => {
            const arr = [].concat(json)
            setData(arr)
        })
        .catch(err => console.log(err))
    }, [])

    const renderItem = (props) => {
        const {item} = props
        return (
            <View>
                <Image 
                    style={styles.img}
                    source={{uri: item.avatar}}
                    onPress={() => navigation.navigate('DetailScreen', {id: item.id})}
                />
                <Text 
                    onPress={() => navigation.navigate('DetailScreen', {id: item.id})} style={styles.item}>{item.content}</Text>
            </View>
        )    
    }

    return(
        <FlatList
            data={data}
            renderItem={renderItem}
            keyExtractor={item => item.id}
        />
    )
}

export default FetchData

const styles = StyleSheet.create({
    item:{
        backgroundColor: 'red',
        color: 'white',
        fontSize: 30,
        marginBottom: 30
    },
    img: {
        width: 150,
        height: 150,
        resizeMode: 'cover'
    }
})