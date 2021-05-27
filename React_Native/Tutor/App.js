import 'react-native-gesture-handler'


import * as React from 'react';
import { NavigationContainer } from '@react-navigation/native'
import { createStackNavigator } from '@react-navigation/stack'

import HomeScreen from './components/HomeScreen'
import DetailScreen from './components/DetailScreen'


const Stack = createStackNavigator()

const App = () => {
    return (
        <NavigationContainer>
            <Stack.Navigator>
                <Stack.Screen name="HomeScreen"component={HomeScreen}/>
                <Stack.Screen name="DetailScreen"component={DetailScreen}/>
            </Stack.Navigator>
        </NavigationContainer>
    )
}

export default App