/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

 import * as React from 'react';
 import { NavigationContainer } from '@react-navigation/native';
 import { createStackNavigator } from '@react-navigation/stack';
 import Products from './components/products'
 import Detail from './components/detail'
 
 const Stack = createStackNavigator();
 
 const App = () => {
   return (
     <NavigationContainer>
       <Stack.Navigator>
         <Stack.Screen name="Products" component={Products} />
         <Stack.Screen name="Detail" component={Detail} />
       </Stack.Navigator>
     </NavigationContainer>
   );
 };



export default App;
