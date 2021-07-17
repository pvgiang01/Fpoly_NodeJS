import React from 'react';
import { createStackNavigator } from '@react-navigation/stack';

import AccountScreen  from '../screens/AccountScreen';
import { LoginScreen } from '../screens/LoginScreen';
import { RegisterScreen } from '../screens/RegisterScreen';
import { FlatListScreen } from '../screens/FlatListScreen';

const Stack = createStackNavigator();

export const AccountNavigator = () => (
  <Stack.Navigator headerMode="none" >
    <Stack.Screen name="FlatListScreen" component={FlatListScreen} />
    <Stack.Screen name="AccountScreen" component={AccountScreen} />
    <Stack.Screen name="LoginScreen" component={LoginScreen} />
    <Stack.Screen name="RegisterScreen" component={RegisterScreen} />
  </Stack.Navigator>
);














