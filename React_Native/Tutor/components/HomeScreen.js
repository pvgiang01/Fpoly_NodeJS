

import React, {useState} from 'react'
import { Text, View, Button, StyleSheet, FlatList } from 'react-native'

const Hello = (props) => {
    const [firstName, setFirstName] = useState('Huỳnh')
    const xuLyButton = () => {
        setFirstName('Trần')
    }
    return (
      <View style={{alignItems: 'center'}}>
        <Text style={styles.text}>{props.my_name}!</Text>
        <Text style={{fontSize: 40}}>{firstName}!</Text>
        <Button title='Click me' onPress={xuLyButton}/>
      </View>
    )
}

const DemoFlatList = props => {
    const data = [
        {
          id: 'bd7acbea-c1b1-46c2-aed5-3ad53abb28ba',
          title: 'First Item',
          avatar: require('../images/005.jpg')
        },
        {
          id: '3ac68afc-c605-48d3-a4f8-fbd91aa97f63',
          title: 'Second Item',
          avatar: require('../images/006.jpg')
        },
        {
          id: '58694a0f-3da1-471f-bd96-145571e29d72',
          title: 'Third Item',
          avatar: require('../images/007.jpg')
        }        
    ]
    const {navigation} = props
    const renderItem = (props) => {
        const {item} = props
        return (
            <View style={styles.item} >
                <Text onPress={() => navigation.navigate('DetailScreen', item)}
                     style={styles.title}>{item.title}</Text>
            </View>
        )
    }
    return (
        <FlatList
                data={data}
                renderItem={renderItem}
                keyExtractor={item => item.id}
            />
    )
}


const Home = props => {
    return (
        <>

            <DemoFlatList navigation={props.navigation}/>
            {/* <Hello my_name="abc"/> */}
        </>
    )
}

export default Home

const styles = StyleSheet.create({
    text:{
        fontSize: 40,
        backgroundColor: 'red',
        color: 'white',
        borderRadius: 50
    },
    item: {
        backgroundColor: '#f9c2ff',
        padding: 20,
        marginVertical: 8,
        marginHorizontal: 16,
      },
      title: {
        fontSize: 32,
      },
})