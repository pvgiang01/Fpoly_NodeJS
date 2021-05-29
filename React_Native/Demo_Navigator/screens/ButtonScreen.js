

import React, { useState, useEffect } from 'react'
import {
    Text, Image, Button,
    TouchableHighlight,
    TouchableOpacity,
    Pressable,
    StyleSheet, View, FlatList
} from 'react-native'






const ButtonScreen = props => {


    return (
        <>  
            <View style={{alignItems:'center'}}>
                <Pressable
                    onPress={() => {}}
                    style={({ pressed }) => [
                        {
                            backgroundColor: pressed
                                ? 'rgb(210, 230, 255)'
                                : 'white'
                        },
                        {
                            height: 50,
                            width: 150,
                            backgroundColor: 'red',
                            
                            borderRadius: 50,
                        }
                    ]}>
                    {({ pressed }) => (
                        <Text style={styles.text}>
                            {pressed ? 'Pressed!' : 'Press Me'}
                        </Text>
                    )}
                </Pressable>
            </View>
        </>
    )
}


export default ButtonScreen


const styles = StyleSheet.create({
    button: {
        alignItems: "center",
        backgroundColor: "#DDDDDD",
        padding: 10
    },
    text:{
        textAlign: 'center',
        color: 'white',
        lineHeight: 30,
        fontSize: 30
    }
})