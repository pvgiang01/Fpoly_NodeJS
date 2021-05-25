


import React, { useState } from 'react';
import {
    StyleSheet, View, Text, TextInput, Button, TouchableHighlight, Pressable,
    Image,
    SafeAreaView, SectionList, ScrollView, StatusBar, TouchableOpacity,
    Alert 
} from 'react-native';



const DemoScrollView = () => {
    return (
        <ScrollView style={styles.scrollView}>
            <Text style={styles.text}>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
                eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
                minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                aliquip ex ea commodo consequat. Duis aute irure dolor in
                reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
                pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
                culpa qui officia deserunt mollit anim id est laborum.
            </Text>
        </ScrollView>
    )
}

const DemoSectionList = () => {
    const DATA = [
        {
            title: "Main dishes",
            data: ["Pizza", "Burger", "Risotto"]
        },
        {
            title: "Sides",
            data: ["French Fries", "Onion Rings", "Fried Shrimps"]
        },
        {
            title: "Drinks",
            data: ["Water", "Coke", "Beer"]
        },
        {
            title: "Desserts",
            data: ["Cheese Cake", "Ice Cream"]
        }
    ];
    const Item = ({ title }) => (
        <View style={styles.item}>
            <Text style={styles.title}>{title}</Text>
        </View>
    );
    return (
        <SectionList
            sections={DATA}
            keyExtractor={(item, index) => item + index}
            renderItem={({ item }) => <Item title={item} />}
            renderSectionHeader={({ section: { title } }) => (
                <Text style={styles.header}>{title}</Text>
            )}
        />
    )
}

const DemoTextInput = () => {
    const [text, onChangeText] = React.useState("Useless Text");
    const [number, onChangeNumber] = React.useState(null);
    const [timesPressed, setTimesPressed] = useState(0);
    const showAlert = () => {
        Alert.alert(
            "Alert Title",
            text + number,
            [
              {
                text: "Cancel",
                onPress: () => console.log("Cancel Pressed"),
                style: "cancel"
              },
              { text: "Oke", onPress: () => console.log("OK Pressed") }
            ]
          );
    }

    return (
        <>
            <View style={styles.inputContainer}>
                <TextInput
                    style={styles.input}
                    onChangeText={onChangeText}
                    value={text}
                />
                <TextInput
                    style={styles.input}
                    onChangeText={onChangeNumber}
                    value={number}
                    placeholder="useless placeholder"
                    keyboardType="numeric"
                />
                {/* <View style={styles.button}>
                    <Button
                        title="Login"
                        onPress={() => { }}
                    // color="#841584"
                    />
                </View>
                <TouchableOpacity
                    style={styles.button}
                    onPress={() => { }}
                >
                    <Text>Press Here</Text>
                </TouchableOpacity>
                <TouchableHighlight onPress={() => { }}>
                    <View style={styles.button}>
                        <Text>Touch Here</Text>
                    </View>
                </TouchableHighlight> */}
                <View style={{
                    // flex: 1,
                    justifyContent: 'center',
                    alignItems: 'center',
                    // height: 50
                }}>
                <Pressable
                    onPress={showAlert}
                    style={({ pressed }) => [
                        {
                            backgroundColor: pressed
                                ? 'rgb(210, 230, 255)'
                                : 'white'
                        },
                        styles.wrapperCustom,
                        {
                            width: 150,
                            borderRadius: 100,
                            justifyContent: 'center',
                            alignItems: 'center'
                        }
                    ]}>
                    {({ pressed }) => (
                        <Text style={{fontSize: 25}} >
                            {pressed ? 'Pressed!' : 'Press Me'}
                        </Text>
                    )}
                </Pressable>
                </View>
                
            </View>
        </>
    )
}


const DemoSlide3 = props => {
    return (
        <>
            {/* <DemoScrollView />
            <DemoSectionList /> */}
            {/* <DemoTextInput /> */}
            <DemoImage/>
        </>
    )
}

const DemoImage = () => {
    return (
        <>

      <Image
        style={styles.tinyLogo}
        source={{
          uri: 'https://reactnative.dev/img/tiny_logo.png',
        }}
      />
      <Image
        style={styles.logo}
        source={require('../imgs/006.jpg')}
      />
        </>
    )
}

const styles = StyleSheet.create({
    tinyLogo: {
        width: 50,
        height: 50,
      },
      logo: {
        width: 266,
        height: 158,
        resizeMode: 'cover'
      },
    inputContainer: {
        padding: 20,
        // justifyContent:'center',
        // flex: 1,
        // alignItems: 'center'
    },
    container: {
        flex: 1,
        paddingTop: StatusBar.currentHeight,
    },
    scrollView: {
        backgroundColor: 'pink',
        marginHorizontal: 20,
    },
    text: {
        fontSize: 42,
    },
    item: {
        backgroundColor: "#f9c2ff",
        padding: 20,
        marginVertical: 8
    },
    header: {
        fontSize: 32,
        backgroundColor: "#fff"
    },
    title: {
        fontSize: 24
    },
    input: {
        height: 40,
        // marginLeft: 12,
        marginTop: 12,
        marginBottom: 12,
        // marginRight: 12,
        borderWidth: 1,
    },
    button: {
        alignItems: "center",
        backgroundColor: "red",
        padding: 10,
        width: 100,
        borderRadius: 100,

    },
    wrapperCustom: {
        borderRadius: 8,
        padding: 6
      },
});

export default DemoSlide3