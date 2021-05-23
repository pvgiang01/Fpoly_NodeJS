import React, { useState } from 'react';
import {Text, StyleSheet, View} from 'react-native';

const Hello = (props) => {   
    const [id, setId] = useState(0)
    const [name, setName] = useState(props.prop_name)

    const xuLySuKien = () => {
        const count = id + 1
        setId(count)
    }
    const xuLySuKienName = () => {
        const newName = 'Trần Văn C'
        setName(newName)
    }
    return (
        <View style={myStyles.container}>      
          <View style={[myStyles.child1, myStyles.child2, {backgroundColor: 'green'}]}></View>
          <View style={myStyles.child2}></View>
          <View style={myStyles.child3}></View>
        </View>
    )  
  }

export default Hello
// View ~ div
// Text ~ p

const myStyles = StyleSheet.create({
  container:{
    flex: 1,
    padding: 50,
    flexDirection: 'column', 
    // justifyContent: 'center',  
    // alignItems: 'center',
    flexWrap: 'wrap',
    position: 'relative'
  },
  child1:{
    width: 50,
    height: 50,
    backgroundColor: 'red',
    position:'absolute',
    top: 50,
    left: 100
  },
  child2:{
    width: 50,
    height: 50,
    backgroundColor: 'yellow',
    // position: 'relative',
    marginTop: 300
  },
  child3:{
    width: 50,
    height: 50,
    backgroundColor: 'blue'
  }
  
})








