import * as React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import products from './components/products'
import detail from './components/detail'


const Stack = createStackNavigator();

const App = () => {
  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen name="Products" component={products}/>
        <Stack.Screen name="Detail" component={detail} />
      </Stack.Navigator>
    </NavigationContainer>
  );
};

export default App;
