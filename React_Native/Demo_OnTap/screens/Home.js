import React, {useState, useEffect} from 'react'
import firebase from '../database/fbConfig'
import { TextInput, View, Pressable, Image, Text, FlatList } from 'react-native'

const Home = props => {
    const {navigation} = props
    const [data, setData] = useState([])

    useEffect(() => {
        firebase.firestore().collection('posts')
        .onSnapshot(res => {
            let arr = []
            res.forEach(element => {
                const {avatar, title, body} = element.data()
                arr.push({avatar, title, body, key: element.id})
            })
            setData(arr)
        })
    }, [])

    const renderItem = ({ item }) => {
        return (
            <View>
                <Pressable onPress={() => navigation.navigate('Detail', {key: item.key})}>
                    <Image 
                        style={{width: 200, height: 200}}
                        source={{uri: item.avatar}}
                    />
                    <Text>{item.title}</Text>
                    <Text>{item.body}</Text>
                </Pressable>
                <Pressable onPress={() => navigation.navigate('Update', {key: item.key})}><Text>Update</Text></Pressable>
            </View>
        )
    }

    return(
        <View>
            <FlatList 
                data={data}
                renderItem={renderItem}
                keyExtractor={item => item.key}
            />
        </View>
    )
}

export default Home