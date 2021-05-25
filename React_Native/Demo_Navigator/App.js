import 'react-native-gesture-handler';

import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';

import HomeScreen from './components/HomeScreen'
import HelloScreen from './components/HelloScreen'
import FlatListScreen from './components/FlatListScreen'
import Lab3 from './components/Lab3'
import ImageScreen from './components/ImageScreen'
import ScollViewScreen from './components/ScrollViewScreen'


const Stack = createStackNavigator()


const App = () => {
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="ScollViewScreen">
        <Stack.Screen name="HomeScreen" component={HomeScreen} />
        <Stack.Screen name="HelloScreen" component={HelloScreen} />
        <Stack.Screen name="FlatListScreen" component={FlatListScreen} />
        <Stack.Screen name="Lab3" component={Lab3} />
        <Stack.Screen name="ImageScreen" component={ImageScreen} />
        <Stack.Screen name="ScollViewScreen" component={ScollViewScreen} />
      </Stack.Navigator>
    </NavigationContainer>
  );
};

export default App;
