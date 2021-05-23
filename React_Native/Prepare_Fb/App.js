// App.js
import 'react-native-gesture-handler';

import * as React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';

import AddUserScreen from './components/AddUserScreen';
import UserScreen from './components/UserScreen';
import UserDetailScreen from './components/UserDetailScreen';

const Stack = createStackNavigator();

export default function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="UserScreen">
        <Stack.Screen name="AddUserScreen" component={AddUserScreen} />
        <Stack.Screen name="UserScreen" component={UserScreen} />
        <Stack.Screen name="UserDetailScreen" component={UserDetailScreen} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}