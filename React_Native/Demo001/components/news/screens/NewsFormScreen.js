import React, {useState, useContext} from 'react';
import { Text, View, StyleSheet, Pressable } from 'react-native';


export const NewsFormScreen = props => {
    return (
        <>
            <Text style={styles.text}>New Form Screen</Text>
        </>
    )
}

const styles = StyleSheet.create({
    text:{
        fontSize: 40
    }
})