import React, {useState, useContext} from 'react';
import { Text, View, StyleSheet, Pressable } from 'react-native';


export const NewsDetailScreen = props => {
    return (
        <>
            <Text style={styles.text}>New Detail Screen</Text>
        </>
    )
}

const styles = StyleSheet.create({
    text:{
        fontSize: 40
    }
})