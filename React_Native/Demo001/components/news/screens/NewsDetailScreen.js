import React, { useState, useContext } from 'react';
import { Text, View, StyleSheet, Pressable, 
    Alert,
    Image, ScrollView } from 'react-native';

import { NewsContext } from '../NewsContext';

export const NewsDetailScreen = props => {
    const { navigation, route: { params: { post } } } = props

    const {onDelete} = useContext(NewsContext)

    const deleteItem = () => {
        onDelete(post.key)
        navigation.navigate('NewsListScreen')
    }

    const confirmDelete = () => {
        Alert.alert(
            'Cảnh báo!!!!',
            'Bạn có chắc muốn xóa hay không?',
            [
                {text:'Có', onPress: deleteItem},
                {text:'Không xóa', onPress: () => {}}
            ],
            {
                cancelable: true,
                onDismiss: () => {}
            }
        )
    }

    return (
        <>
            <ScrollView style={styles.container}>
                <Text style={styles.text}>New Detail Screen</Text>                
                    <Text style={styles.text}>{post.title}</Text>
                    <Image style={styles.image}
                        source={{uri:post.images}}/>
                    <Text style={styles.text}>{post.content}</Text>                
                <Pressable style={styles.press} onPress={confirmDelete}>
                    <Text style={styles.text}>Delete</Text>
                </Pressable>
            </ScrollView>
        </>
    )
}

const styles = StyleSheet.create({
    press:{
        backgroundColor: 'red',
        width:200,
        height: 50
    },
    image:{
        width: 300,
        height: 100,
        resizeMode:'cover'
    },
    container:{
        padding: 16,
        marginBottom: 32,
        paddingBottom: 32
    },
    text: {
        fontSize: 40
    }
})