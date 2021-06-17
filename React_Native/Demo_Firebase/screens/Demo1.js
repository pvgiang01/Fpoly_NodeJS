import React, { useState, useEffect, useCallback } from 'react'
import {
    Modal, ScrollView, RefreshControl,
    Pressable, Text, View, Alert,
    TextInput, ActivityIndicator, Button, StyleSheet,
    Image, PlatformColor, Switch
} from 'react-native'
import Demo2 from './Demo2'

const Demo1 = props => {
    const [name, setName] = useState('Nguyen Van A')
    const [age, setAge] = useState(20)
    const [mobile, setMobile] = useState('0982727634')
    const [isOn, setIsOn] = useState(false)
    const onChange = () => {
        setIsOn(previousState => {
            return !previousState
        })
        setIsOn(true)
    }
    return (
        // <View>
        //     <Switch 
        //         trackColor={{false: '#eb8034', true: '#3449eb'}}
        //         thumbColor={isOn === true ? '#c9eb34' : '#393d29'}
        //         onValueChange={onChange}
        //         value={isOn}
        //     />
        //     <Text>{isOn ? 'On' : 'Off'}</Text>
        // </View>
        // <Demo2 name={name} age={age} mobile={mobile}/>
        <Demo2 {...{name, age, mobile}}/>
    )    
}

export default Demo1