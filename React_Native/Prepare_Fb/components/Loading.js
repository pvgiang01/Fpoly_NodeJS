import React, {useState, useEffect} from 'react'
import { View, Text, ActivityIndicator, StyleSheet } from 'react-native'
import firebase from '../helper/firebaseDB';


const Loading = props => {

    const {navigation} = props

    useEffect(() => {
        const subscriber =  firebase.auth().onAuthStateChanged(user => {
            navigation.navigate(user ? 'Main' : 'SignUp')
          })
        return subscriber // unsubscribe on unmount
    }, [])


    return (
      <View style={styles.container}>
        <Text>Loading</Text>
        <ActivityIndicator size="large" />
      </View>
    )
  
}

export default Loading


const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  }
})