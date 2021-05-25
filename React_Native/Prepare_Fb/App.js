// App.js
import 'react-native-gesture-handler';

import * as React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';

import AddUserScreen from './components/AddUserScreen';
import UserScreen from './components/UserScreen';
import UserDetailScreen from './components/UserDetailScreen';
import DemoSlide3 from './components/DemoSlide3'
import DemoSlide4 from './components/DemoSlide4'

const Stack = createStackNavigator();

export default function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="DemoSlide3">
        <Stack.Screen name="AddUserScreen" component={AddUserScreen} />
        <Stack.Screen name="UserScreen" component={UserScreen} />
        <Stack.Screen name="UserDetailScreen" component={UserDetailScreen} />
        <Stack.Screen name="DemoSlide3" component={DemoSlide3} />
        <Stack.Screen name="DemoSlide4" component={DemoSlide4} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}