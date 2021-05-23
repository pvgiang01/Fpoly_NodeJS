import React, {useState} from 'react';
import {SafeAreaView,Text,} from 'react-native';
import Hello from './components/hello'

const App = () => {
  const [name, setName] = useState('Nguyễn Văn A')
  const xuLySuKienBienName = (new_name) => {
    setName(new_name)
  }
  return (
    <Hello prop_name={name} suKien={xuLySuKienBienName}>
      </Hello>
  );
};

export default App;


// ES6
// react-native init PS12345_NguyenVanA_Lab01
// react-native run-android
// npx react-native run-android

// component
// function component, class component


// properties: props -->> không thay đổi
// state ->>> của riêng component, có thể thay đổi