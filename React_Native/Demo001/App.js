import React, {useState} from 'react';
import {Text, View, StyleSheet, Button} from 'react-native'
import PhepTinh from './components/PhepTinh';
import PhepCong from './components/PhepCong';
import KetQua from './components/KetQua';
import DoiSo from './components/DoiSo';

// component
const App = () => {

  const [a, setA] = useState(7)
  const [b, setB] = useState(5)

  const onChangeNumber = (number1, number2) => {
    setA(number1)
    setB(number2)
  }

  return (
    <View>
      <PhepCong a={a} b={b}/>
      <KetQua a={a} b={b}/>
      <DoiSo onChangeNumber={onChangeNumber}/>
    </View>
  )
}

export default App

const styles = StyleSheet.create({
  text:{
    fontSize: 40
  }
})

// npx react-native run-android
