import React, {useState, useContext} from 'react';
import {createStackNavigator} from '@react-navigation/stack';

import {NewsListScreen} from './screens/NewsListScreen';
import {NewsDetailScreen} from './screens/NewsDetailScreen';
import {NewsFormScreen} from './screens/NewsFormScreen';

import {NewsContextProvider} from './NewsContext';

const Stack = createStackNavigator();

export const NewsNavigation = props => (
  <NewsContextProvider>
    <Stack.Navigator headerMode="none">
      <Stack.Screen component={NewsListScreen} name="NewsListScreen" />
      <Stack.Screen component={NewsDetailScreen} name="NewsDetailScreen" />
      <Stack.Screen component={NewsFormScreen} name="NewsFormScreen" />
    </Stack.Navigator>
  </NewsContextProvider>
);
