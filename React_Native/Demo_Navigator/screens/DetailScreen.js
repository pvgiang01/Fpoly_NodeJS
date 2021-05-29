


import React, {useState, useEffect} from 'react'
import {Text, Image, StyleSheet, View, FlatList, Button} from 'react-native'



const DetailScreen = props => {
    const {navigation, route:{params}} = props

    const [post, setPost] = useState(null)
    
    useEffect(() => {
        fetch('https://60ae432680a61f0017332d65.mockapi.io/api/v1/comments/' + params.id)
        .then(res => res.json())
        .then(json => { setPost(json) })
        .catch(err => console.log(err))
    }, [])

    
    if (!post) {
        return (<></>)
    }
    return (
        <View>
            <Image 
                style={styles.img}
                source={{uri: post.avatar}}
            />
            <Text style={styles.item}>{post.content}</Text>
            <Button 
            title='Add New'
            onPress={() => navigation.navigate('AddNewScreen')}/>
        </View>
    )
}

export default DetailScreen

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