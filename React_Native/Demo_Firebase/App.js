
import 'react-native-gesture-handler'

import * as React from 'react'
import { NavigationContainer } from '@react-navigation/native'
import { createStackNavigator } from '@react-navigation/stack'

import Home from './screens/Home'
import Loading from './screens/Loading'
import Login from './screens/Login'
import SignUp from './screens/SignUp'
import Details from './screens/Details'


const Stack = createStackNavigator()

export default function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="Loading">
        <Stack.Screen name="Home" component={Home} />
        <Stack.Screen name="Details" component={Details} />
        <Stack.Screen name="Loading" component={Loading} />
        <Stack.Screen name="Login" component={Login} />
        <Stack.Screen name="SignUp" component={SignUp} />        
      </Stack.Navigator>
    </NavigationContainer>
  )
}