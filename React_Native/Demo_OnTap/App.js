

import 'react-native-gesture-handler'

import  React, {useState} from 'react'
import { NavigationContainer } from '@react-navigation/native'
import { createStackNavigator } from '@react-navigation/stack'

import Home from './screens/Home'
import Login from './screens/Login'
import Loading from './screens/Loading'
import SignUp from './screens/SignUp'

const Stack = createStackNavigator()

const App = () => {
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="Loading">
        <Stack.Screen name="Home" component={Home}/>
        <Stack.Screen name="Login" component={Login}/>
        <Stack.Screen name="Loading" component={Loading}/>
        <Stack.Screen name="SignUp" component={SignUp}/>
      </Stack.Navigator>
    </NavigationContainer>
  )
}

export default App