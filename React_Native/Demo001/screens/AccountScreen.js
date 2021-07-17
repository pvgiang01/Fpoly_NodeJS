import React, { useState } from 'react'
import { Text, View, StyleSheet, Button, Pressable } from 'react-native';

const AccountScreen = props => {
    const [a, setA] = useState(1)
    const [b, setB] = useState(6)
    const [kq1, setKq1] = useState(7)
    const [kq2, setKq2] = useState(3)
    const [kq3, setKq3] = useState(5)
    const [diem, setDiem] = useState(0)

    const onPressButton = value => {
        const check = (Number(a) + Number(b)) == Number(value)
        if (check == true) {
            setDiem(diem + 1)
        }
        else {
            setDiem(diem == 0 ? 0 : diem - 1)
        }

        let _a = Math.floor(Math.random() * 5)
        let _b = Math.floor(Math.random() * 5)
        let _kq1 = Math.floor(Math.random() * 10)
        let _kq2 = Math.floor(Math.random() * 10)
        let _kq3 = Math.floor(Math.random() * 10)

        let ran = Math.floor(Math.random() * 2) // 0 , 1 , 2
        if (ran == 0) {
            _kq1 = _a + _b
        } else if (ran == 1) {
            _kq2 = _a + _b
        } else {
            _kq3 = _a + _b
        }

        setA(_a)
        setB(_b)
        setKq1(_kq1)
        setKq2(_kq2)
        setKq3(_kq3)
    }

    return (
        <>
            <View style={styles.container}>
                <View style={styles.textContainer}>
                    <Text style={styles.textScore}>Score: {diem}</Text>
                </View>
                <View style={styles.operationContainer}>
                    <Text style={styles.textoperation}>{a} + {b} = ?</Text>
                </View>
                <View style={styles.buttonContainer}>
                    <Pressable style={styles.result1Container}
                        onPress={() => onPressButton(kq1)}>
                        <Text style={styles.textResult1}>{kq1}</Text>
                    </Pressable>
                    <Pressable style={[styles.result1Container, {backgroundColor: '#0048FF'}]}
                        onPress={() => onPressButton(kq2)}>
                        <Text style={styles.textResult1}>{kq2}</Text>
                    </Pressable>
                    <Pressable style={[styles.result1Container, styles.backgroundColor3]}
                        onPress={() => onPressButton(kq3)}>
                        <Text style={styles.textResult1}>{kq3}</Text>
                    </Pressable>
                </View>
            </View>
        </>
    )
}

export default AccountScreen

const styles = StyleSheet.create({
    backgroundColor3:{
        backgroundColor: '#008A13'
    },
    buttonContainer: {
        alignItems: 'center'
    },
    result1Container: {
        margin: 20,
        alignItems: 'center',
        backgroundColor: '#A30001',
        width: '50%',
        height: 80,
        alignItems: 'center',
        justifyContent: 'center',
        borderRadius: 30,
        borderWidth: 2,
        borderColor: 'white'
    },
    textResult1: {
        color: 'white',
        fontSize: 50
    },
    operationContainer: {
        marginTop: 100,
        alignItems: 'center'
    },
    textoperation: {
        color: 'white',
        fontSize: 80
    },
    textContainer: {
        marginTop: 50,
    },
    textScore: {
        color: 'white',
        fontSize: 35
    },
    container: {
        backgroundColor: '#4D005E',
        padding: 8,
        flex: 1
    }
})