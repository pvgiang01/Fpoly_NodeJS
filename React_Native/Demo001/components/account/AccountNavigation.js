import React, {useState, useContext} from 'react';
import { createStackNavigator } from '@react-navigation/stack';

import { LoginScreen } from './screens/LoginScreen';
import { RegisterScreen } from './screens/RegisterScreen';

const Stack = createStackNavigator();

export const AccountNavigation = props => (
    <Stack.Navigator headerMode="none">
        <Stack.Screen component={LoginScreen} name="LoginScreen" />
        <Stack.Screen component={RegisterScreen} name="RegisterScreen" />
    </Stack.Navigator>
)