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
import FetchDataScreen from './components/FetchDataScreen'
import ButtonScreen from './components/ButtonScreen'
import DetailScreen from './components/DetailScreen'


const Stack = createStackNavigator()


const App = () => {
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="FetchDataScreen">
        <Stack.Screen name="DetailScreen" component={DetailScreen} />
        <Stack.Screen name="HomeScreen" component={HomeScreen} />
        <Stack.Screen name="ButtonScreen" component={ButtonScreen} />
        <Stack.Screen name="FetchDataScreen" component={FetchDataScreen} />
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
