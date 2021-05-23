import 'react-native-gesture-handler';

import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';

import HomeScreen from './components/HomeScreen'
import HelloScreen from './components/HelloScreen'
import FlatListScreen from './components/FlatListScreen'

const Stack = createStackNavigator()


const App = () => {
  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen 
          name="HomeScreen"
          component={HomeScreen}
        />
        <Stack.Screen 
          name="HelloScreen"
          component={HelloScreen}
        />
        <Stack.Screen 
          name="FlatListScreen"
          component={FlatListScreen}
        />
      </Stack.Navigator>
    </NavigationContainer>
  );
};

export default App;
