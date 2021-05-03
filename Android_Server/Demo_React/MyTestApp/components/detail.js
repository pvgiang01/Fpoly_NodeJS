import React from 'react';
import { SafeAreaView, View, StyleSheet, Image, Text, StatusBar, useColorScheme } from 'react-native';
import { Colors, Header, } from 'react-native/Libraries/NewAppScreen';


const Detail = ({ navigation, route }) => {
    const { item: pro } = route.params
    const isDarkMode = useColorScheme() === 'dark';

    const backgroundStyle = {
        backgroundColor: isDarkMode ? Colors.darker : Colors.lighter,
    };

    console.log('>>>>>>>>>>>>>>>>>',pro.img)
    return (
        <SafeAreaView style={backgroundStyle}>
            <StatusBar barStyle={isDarkMode ? 'light-content' : 'dark-content'} />
            <Header />
            <View style={styles.item}>
                <Text style={styles.title}>{pro._id}</Text>
                <Text style={styles.title}>{pro.productName}</Text>
                <Text style={styles.title}>{pro.price}</Text>
                <Image
                    style={styles.logo}
                    source={{ uri: 'http://10.0.2.2:3000/images/' + pro.img }} />
            </View>
        </SafeAreaView>

    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        marginTop: StatusBar.currentHeight || 0,
    },
    item: {
        backgroundColor: '#f9c2ff',
        padding: 20,
        marginVertical: 8,
        marginHorizontal: 16,
    },
    title: {
        fontSize: 32,
    },
    logo: {
        width: 66,
        height: 58,
        resizeMode: 'cover',
    },
});

export default Detail;