
import * as React from 'react'

import { Button, StyleSheet } from 'react-native'



const HomeScreen = (props) => {
    const {navigation:{navigate}} = props
    const myParams = {name: 'Nguyen Van Anh', age: 18}
    return (
        <>
            <Button 
                style={styles.button}
                title="Go to Hello Screen"
                onPress={() => navigate('HelloScreen', myParams)}
            />
            <Button
                style={styles.button}
                title="Go to FlatList Screen"
                onPress={() => navigate('FlatListScreen')}
            />
            <Button
                style={styles.button}
                title="Go to Lab 3"
                onPress={() => navigate('Lab3')}
            />
            <Button
                style={styles.button}
                title="Go to Image Screen"
                onPress={() => navigate('ImageScreen')}
            />
        </>
    )
}

export default HomeScreen

const styles = StyleSheet.create({
    button:{
        marginBottom: 30
    }
})