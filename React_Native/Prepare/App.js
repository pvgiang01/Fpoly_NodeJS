

// import React, {useState} from 'react';
// import {
//   SafeAreaView,
//   ScrollView,
//   StatusBar,
//   StyleSheet,
//   Text,
//   TextInput,
//   useColorScheme,
//   View,
//   FlatList,
//   SectionList
// } from 'react-native';


// const App = () => {
//   const DATA = [
//     {
//       id: 'bd7acbea-c1b1-46c2-aed5-3ad53abb28ba',
//       title: 'First Item',
//     },
//     {
//       id: '3ac68afc-c605-48d3-a4f8-fbd91aa97f63',
//       title: 'Second Item',
//     },
//     {
//       id: '58694a0f-3da1-471f-bd96-145571e29d72',
//       title: 'Third Item',
//     },
//     {
//       id: 'bd7acbea-c1b1-46c2-aed5-3ad53abb29ba',
//       title: 'First Item',
//     },
//     {
//       id: '3ac68afc-c615-48d3-a4f8-fbd91aa97f63',
//       title: 'Second Item',
//     },
//     {
//       id: '58194a0f-3da1-471f-bd96-145571e29d72',
//       title: 'Third Item',
//     },
//     {
//       id: 'bd2acbea-c1b1-46c2-aed5-3ad53abb28ba',
//       title: 'First Item',
//     },
//     {
//       id: '3ac38afc-c605-48d3-a4f8-fbd91aa97f63',
//       title: 'Second Item',
//     },
//     {
//       id: '58094a0f-3da1-471f-bd96-145571e29d72',
//       title: 'Third Item',
//     },
//   ];
//   const DATA1 = [
//     {
//       title: "Main dishes",
//       data: ["Pizza", "Burger", "Risotto"]
//     },
//     {
//       title: "Sides",
//       data: ["French Fries", "Onion Rings", "Fried Shrimps"]
//     },
//     {
//       title: "Drinks",
//       data: ["Water", "Coke", "Beer"]
//     },
//     {
//       title: "Desserts",
//       data: ["Cheese Cake", "Ice Cream"]
//     }
//   ];
  
//   const [text, onChangeText] = useState("Useless Text");
//   const [number, onChangeNumber] = useState(null);

//   const Item = ({ title }) => (
//     <View style={styles.item}>
//       <Text style={styles.title}>{title}</Text>
//     </View>
//   );

//   const renderItem = ({ item }) => (
//     <Item title={item.title} />
//   );

//   return (
//     <SafeAreaView style={styles.container}>
//       <Text style={styles.text}>Hello</Text>
//       {/* <FlatList
//         data={DATA}
//         renderItem={renderItem}
//         keyExtractor={item => item.id}
//       /> */}

//       {/* <SectionList
//         sections={DATA1}
//         keyExtractor={(item, index) => item + index}
//         renderItem={({ item }) => <Item title={item} />}
//         renderSectionHeader={({ section: { title } }) => (
//           <Text style={styles.header}>{title}</Text>
//         )}
//       /> */}

//       {/* <ScrollView style={styles.scrollView}>
//         <Text style={styles.text}>
//           Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
//           eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
//           minim veniam, quis nostrud exercitation ullamco laboris nisi ut
//           aliquip ex ea commodo consequat. Duis aute irure dolor in
//           reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
//           pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
//           culpa qui officia deserunt mollit anim id est laborum.
//           Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
//           eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
//           minim veniam, quis nostrud exercitation ullamco laboris nisi ut
//           aliquip ex ea commodo consequat. Duis aute irure dolor in
//           reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
//           pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
//           culpa qui officia deserunt mollit anim id est laborum.
//           Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
//           eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
//           minim veniam, quis nostrud exercitation ullamco laboris nisi ut
//           aliquip ex ea commodo consequat. Duis aute irure dolor in
//           reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
//           pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
//           culpa qui officia deserunt mollit anim id est laborum.
//         </Text>
        
//       </ScrollView> */}
//       <TextInput
//         style={styles.input}
//         onChangeText={onChangeText}
//         value={text}
        
//       />
//       <TextInput
//         style={styles.input}
//         onChangeText={onChangeNumber}
//         value={number}
//         placeholder="useless placeholder"
//         keyboardType="numeric"
//       />

//     </SafeAreaView>
//   );
// };

// const styles = StyleSheet.create({
//   input: {
//     height: 40,
//     margin: 12,
//     borderWidth: 1,
//   },
//   container:{
//     flex: 1,
//     backgroundColor: 'lightgrey'
//   },
//   scrollView: {
//     backgroundColor: 'pink',
//     // marginHorizontal: 20,
//   },
//   text: {
//     fontSize: 30,
//     fontWeight: 'bold'
//   },
//   item: {
//     backgroundColor: '#f9c2ff',
//     padding: 20,
//     marginVertical: 8,
//     marginHorizontal: 16,
//   },
//   title: {
//     fontSize: 32,
//   },
//   header: {
//     fontSize: 32,
//     backgroundColor: "#fff"
//   },
// });

// export default App;


import 'react-native-gesture-handler';
import * as React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import HomeScreen from './components/home'
import ProfileScreen from './components/Profile'

const Stack = createStackNavigator();

const App = () => {
  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen
          name="Home"
          component={HomeScreen}
          options={{ title: 'Welcome' }}
        />
        <Stack.Screen name="Profile" component={ProfileScreen} />
      </Stack.Navigator>
    </NavigationContainer>
  );
};

export default App;