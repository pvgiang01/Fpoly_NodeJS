import React from 'react';
import { createStackNavigator } from '@react-navigation/stack';

import { ProductScreen } from '../screens/ProductScreen';
import { ProductsContextProvider } from './ProductContext';

const Stack = createStackNavigator();

export const AppNavigator = () => (
    <ProductsContextProvider>
        <Stack.Navigator headerMode="none">
            <Stack.Screen name="ProductScreen" component={ProductScreen} />
        </Stack.Navigator>
    </ProductsContextProvider>

);
