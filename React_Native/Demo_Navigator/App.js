import 'react-native-gesture-handler';

import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';

import HomeScreen from './screens/HomeScreen'
import HelloScreen from './screens/HelloScreen'
import FlatListScreen from './screens/FlatListScreen'
import Lab3 from './screens/Lab3'
import ImageScreen from './screens/ImageScreen'
import ScollViewScreen from './screens/ScrollViewScreen'
import FetchDataScreen from './screens/FetchDataScreen'
import ButtonScreen from './screens/ButtonScreen'
import DetailScreen from './screens/DetailScreen'
import AnimationScreen from './screens/AnimationScreen'
import AddNewScreen from './screens/AddNewScreen'


const Stack = createStackNavigator()


const App = () => {
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="FetchDataScreen">
        <Stack.Screen name="DetailScreen" component={DetailScreen} />
        <Stack.Screen name="AddNewScreen" component={AddNewScreen} />
        <Stack.Screen name="AnimationScreen" component={AnimationScreen} />
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
