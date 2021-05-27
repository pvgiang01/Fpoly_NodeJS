import { StatusBar } from 'expo-status-bar';
import * as React from 'react';
import { StyleSheet} from 'react-native';
import { NavigationContainer } from '@react-navigation/native';
import { createDrawerNavigator } from '@react-navigation/drawer';
import { createStackNavigator } from "@react-navigation/stack";
import {Feather} from '@expo/vector-icons';
import Splash from './src/Assignment/Screens/Splash';
import SignIn from './src/Assignment/Screens/SignIn';
import SignUp from './src/Assignment/Screens/SignUp';
import Home from './src/Assignment/Screens/Home';
import DSSV from './src/Assignment/Screens/DSSV'
import Cart from './src/Assignment/Screens/Cart'
import Index from "./src/Assignment/Screens/Index";
import ForgetPass from "./src/Assignment/Screens/ForgetPass";
import AddButton from "./src/Assignment/Components/AddButton";
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { FontAwesome5 } from "@expo/vector-icons";
const DrawerNavigator= createDrawerNavigator();
const TabNavigator = createBottomTabNavigator();

import socketIOClient from "socket.io-client";

const ENDPOINT = "http://192.168.1.18:3000";
const socket = socketIOClient(ENDPOINT);

export default function App() {
  socket.emit("test", "Emit from client");
  const Stack = createStackNavigator();
  return (
    // <DSSV/>
    <NavigationContainer>
      <Stack.Navigator initialRouteName="Splash" sreenOptions={{ headerShown: true }}>
        <Stack.Screen name="Splash" component={Splash} options={{ title: 'Splash' }} />       
        <Stack.Screen name="SignIn" component={SignIn} options={{ title: 'Sign In' }} />    
        <Stack.Screen name="SignUp" component={SignUp} options={{ title: 'Sign Up' }} />            
        <Stack.Screen name="About" component={Drawer} options={{ title: 'Memphis' }} />            
        <Stack.Screen name="ForgetPass" component={ForgetPass} options={{ title: 'Forget Pass' }} />            
      </Stack.Navigator>
     </NavigationContainer>

);
}
function Drawer(){
  return(
  <DrawerNavigator.Navigator>
    <DrawerNavigator.Screen name="About" component={Home} options={{ title: 'About ' }}/>          
    <DrawerNavigator.Screen name="DSSV" component={Bottom} options={{ title: 'Danh sách sinh viên' }}/>
    <DrawerNavigator.Screen name="Index" component={Index} options={{ title: 'Index ' }}/>        
  </DrawerNavigator.Navigator>
  );
}
function Bottom(){
  return(
  <TabNavigator.Navigator tabBarOptions={{activeTintColor:"#6495ed"}}
  >      
    <TabNavigator.Screen name="DSSV" component={DSSV} options={{
                              tabBarLabel: 'DSSV',
                              tabBarIcon: ({color,size}) => (
                              <FontAwesome5 name="list-ul" size={24} color="#CDCCCE" />
                              ),
                        }}  /> 
                     
    <TabNavigator.Screen name="BangDiem" component={Cart} options={{
                              tabBarLabel: 'Bảng Điểm',
                              tabBarIcon: ({color,size}) => (
                              <FontAwesome5 name="table" size={24} color="#CDCCCE" />
                              ),
                        }}  />       
  </TabNavigator.Navigator>
  );
}
const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
