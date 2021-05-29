

import * as React from 'react'
import { Text, StyleSheet } from 'react-native'


const HelloScreen = (props) => {
    const {navigation, route:{params:{name, age}}} = props
    return (
        <>
            <Text style={styles.text}>Name: {name}</Text>
            <Text style={styles.text}>Age: {age}</Text>
        </>
    )
}

const styles = StyleSheet.create({
    text:{
        fontSize: 30,
        fontWeight: 'bold',
        color: 'red'
    }
})

export default HelloScreen