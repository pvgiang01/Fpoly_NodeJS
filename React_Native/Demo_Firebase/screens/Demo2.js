import React, { useState, useEffect, useCallback } from 'react'
import {
    Modal, ScrollView, RefreshControl,
    Pressable, Text, View, Alert,
    TextInput, ActivityIndicator, Button, StyleSheet,
    Image, PlatformColor, Switch, SectionList
} from 'react-native'


const Demo2 = props => {

    const contacts = [
        {
            title: 'Khach hang', 
            data: ['Nguyen Van A', 'Tran Van B', 'Le Van C']
        },
        {
            title: 'Gia dinh', 
            data: ['Nguyen Van A', 'Tran Van B', 'Le Van C']
        },
        {
            title: 'Ban be', 
            data: ['Nguyen Van A', 'Tran Van B', 'Le Van C']
        },
    ]
    const {name, age, mobile} = props

    const renderItem = val => {
        const {item} = val
        return (
            <View>
                <Text style={{backgroundColor:'yellow', fontSize: 15}}>{item}</Text>
            </View>
        )
    }

    const renderSectionHeader = val => {
        const {section: {title}} = val
        return(
            <Text style={{backgroundColor:'red', fontSize: 20}}>{title}</Text>
        )
    }

    return(
        <View>
            <SectionList
                sections={contacts}
                keyExtractor={(item, index) => item + index}
                renderItem={renderItem}
                renderSectionHeader={renderSectionHeader}
            />
        </View>

        // <View>
        //     <Text>{name}</Text>
        //     <Text>{age}</Text>
        //     <Text>{mobile}</Text>
        //     <Text>
        //         Xin chao
        //         <View>
        //             <Text>Buoi Sang</Text>
        //             <Image
        //                 source={{uri:'https://cdn.tuoitre.vn/thumb_w/586/2021/6/17/bvcuchi-1623892450313489988883.jpg'}}
        //                 style={{width: 50, height: 50}}
        //                 resizeMode='cover'
        //             />
        //         </View>
        //     </Text>
        // </View>
    )
    
}

export default Demo2