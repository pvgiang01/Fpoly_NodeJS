

import React, { useState, useEffect, useRef } from 'react'
import {
    Text, Image, StyleSheet,
    View, FlatList, Animated, Button, Easing
} from 'react-native'

const AnimationScreen = () => {
    const fade = useRef(new Animated.Value(0)).current
    
    const resizeImg = () => {
        Animated.timing(fade, {
            toValue: 1,
            duration: 5000,
            useNativeDriver: true,
            easing: Easing.ease
        }).start()
    }

    const fadeIn = () => {
        Animated.timing(fade, {
            toValue: 1,
            duration: 5000,
            useNativeDriver: true
        }).start()
    }

    const fadeOut = () => {
        Animated.timing(fade, {
            toValue: 0,
            duration: 1000,
            useNativeDriver: true
        }).start()
    }

    return (
        <>
            <Animated.Image 
                style={[styles.container,
                    {
                        position:'absolute',
                        top: 100,
                        left: 50,
                        width: 50,
                        height:50,
                        transform:[
                            {
                                translateX: fade.interpolate({
                                    inputRange: [0, 1],
                                    outputRange: [0, 100]
                                })
                            },
                            {
                                translateY: fade.interpolate({
                                    inputRange: [0, 1],
                                    outputRange: [0, 25]
                                })
                            },
                            {
                                scaleX: fade.interpolate({
                                    inputRange: [0, 1],
                                    outputRange: [1, 25]
                                })
                            },
                            {
                                scaleY: fade.interpolate({
                                    inputRange: [0, 1],
                                    outputRange: [1, 15]
                                })
                            }
                        ]
                    }]}
                source={require('../images/008.jpg')}
                // resizeMethod='cover'
                />

            <Button title='Resize Img'
                onPress={resizeImg} />
        </>
    )
}

export default AnimationScreen

const styles = StyleSheet.create({
    container: {
        // resizeMode:'cover',
        // width: 50,
        // height: 50
    },
    text: {
        fontSize: 30
    }
})