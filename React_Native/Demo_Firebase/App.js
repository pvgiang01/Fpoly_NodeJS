
import 'react-native-gesture-handler'

import  React, {useState} from 'react'
import { NavigationContainer } from '@react-navigation/native'
import { createStackNavigator } from '@react-navigation/stack'

import Home from './screens/Home'
import Loading from './screens/Loading'
import Login from './screens/Login'
import SignUp from './screens/SignUp'
import Details from './screens/Details'
import AddNew from './screens/AddNew'
import Demo1 from './screens/Demo1'
import Demo2 from './screens/Demo2'

const Stack = createStackNavigator()

export default function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="Demo1">
        <Stack.Screen name="AddNew" component={AddNew} />
        <Stack.Screen name="Home" component={Home} />
        <Stack.Screen name="Demo1" component={Demo1} />
        <Stack.Screen name="Demo2" component={Demo2} />
        <Stack.Screen name="Details" component={Details} />
        <Stack.Screen name="Loading" component={Loading} />
        <Stack.Screen name="Login" component={Login} />
        <Stack.Screen name="SignUp" component={SignUp} />        
      </Stack.Navigator>
    </NavigationContainer>
  )
}