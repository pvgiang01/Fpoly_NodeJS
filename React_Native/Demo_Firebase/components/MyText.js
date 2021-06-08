

import React, { useState, useEffect, useCallback } from 'react'
import { StyleSheet, Text } from 'react-native'


const MyText = props => {
    return (
        <Text style={styles.text}>{props.children}</Text>
    )
}

export default MyText

const styles = StyleSheet.create({
    text: {
        fontSize: 30,
        color: 'blue'
    }
})