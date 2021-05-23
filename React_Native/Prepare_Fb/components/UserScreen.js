// screens/UserScreen.js

import React, { useEffect, useState } from 'react';
import { StyleSheet, ScrollView, ActivityIndicator, FlatList, View, Text, Button } from 'react-native';
import firebase from '../helper/firebaseDB';

const UserScreen = props => {
    const {navigation: {navigate}} = props
    const [isLoading, setLoading] = useState(true);
    const [data, setData] = useState([]);

    useEffect(() => {
        const fetch = firebase.firestore()
        .collection('posts')
        .onSnapshot(processData)
        return fetch
      }, []);
    
    const processData = querySnapshot => {
        setLoading(true)
        let items = []
        querySnapshot.forEach((res) => {
            console.log('>>>>>>>',res.data())
            const { id, title, body } = res.data();
            items.push({key: res.id, id, title, body})
        })
        setData(items)
        setLoading(false)
    }

    const renderItem = ({ item }) => (
        <View >
            <Text onPress={() => navigate('UserDetailScreen', {key: item.key})}>{item.title}</Text>
        </View>
    )

    // if (isLoading) {
    //     return(
    //         <View>
    //             <ActivityIndicator size="large" color="#9E9E9E"/>
    //         </View>
    //     )
    // }
    return(
        <View>
            <FlatList
                data={data}
                renderItem={renderItem}
                keyExtractor={item => item.key}
            />
            <Button 
                title='Add New'
                onPress={() => navigate('AddUserScreen', {count: data.length})}
            />
        </View>
    )
}





// import React, { Component } from 'react';
// import { StyleSheet, ScrollView, ActivityIndicator, FlatList, View } from 'react-native';
// // import { ListItem } from 'react-native-elements'
// import firebase from '../helper/firebaseDB';

// class UserScreen extends Component {

//   constructor() {
//     super();
//     this.firestoreRef = firebase.firestore().collection('posts');
//     this.state = {
//       isLoading: true,
//       userArr: []
//     };
//   }

//   componentDidMount() {
//     this.unsubscribe = this.firestoreRef.onSnapshot(this.getCollection);
//   }

//   componentWillUnmount(){
//     this.unsubscribe();
//   }

//   getCollection = (querySnapshot) => {
//     const userArr = [];
//     querySnapshot.forEach((res) => {
//         console.log('>>>>>>>',res.data())
//     //   const { name, email, mobile } = res.data();
//     //   userArr.push({
//     //     key: res.id,
//     //     res,
//     //     name,
//     //     email,
//     //     mobile,
//     //   });
//     });
//     this.setState({
//       userArr,
//       isLoading: false,
//    });
//   }

//   render() {
//     return(
//         <View>
//           <ActivityIndicator size="large" color="#9E9E9E"/>
//         </View>
//       )
//   }
// }



export default UserScreen;