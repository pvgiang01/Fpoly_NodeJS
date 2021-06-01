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
import Loading from './components/Loading'
import SignUp from './components/SignUp'
import Login from './components/Login'
import Main from './components/Main'

const Stack = createStackNavigator();

export default function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="Loading">
        <Stack.Screen name="AddUserScreen" component={AddUserScreen} />
        <Stack.Screen name="UserScreen" component={UserScreen} />
        <Stack.Screen name="UserDetailScreen" component={UserDetailScreen} />
        <Stack.Screen name="DemoSlide3" component={DemoSlide3} />
        <Stack.Screen name="DemoSlide4" component={DemoSlide4} />
        <Stack.Screen name="Loading" component={Loading} />
        <Stack.Screen name="SignUp" component={SignUp} />
        <Stack.Screen name="Login" component={Login} />
        <Stack.Screen name="Main" component={Main} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}