import React, { useEffect, useState } from 'react';
import { SafeAreaView, View, FlatList, StyleSheet, Text, StatusBar, useColorScheme } from 'react-native';

import { Colors, Header, } from 'react-native/Libraries/NewAppScreen';

const Item = ({ item, navigation }) => {
    const onPress = (item) => {
        navigation.navigate('Detail', { item: item })
    }
    return (
        <View style={styles.item}>
            <Text style={styles.title} onPress={() => onPress(item)}>{item.productName}</Text>
        </View>
    )
};

const Products = ({navigation}) => {
    const [data, setData] = useState([]);
    useEffect(() => {
        fetch('http://10.0.2.2:3000/api/products')
            .then((response) => response.json())
            .then((json) => setData(json))
            .catch((error) => console.error('>>>>>>>',error));
    }, []);

    const renderItem = ({ item }) => (
        <Item item={item} navigation={navigation} />
    );
    console.log('===>>>',data)

    const isDarkMode = useColorScheme() === 'dark';

    const backgroundStyle = {
        backgroundColor: isDarkMode ? Colors.darker : Colors.lighter,
    };

    return (
        <SafeAreaView style={backgroundStyle}>
            <StatusBar barStyle={isDarkMode ? 'light-content' : 'dark-content'} />
            <Header />
            <FlatList
                data={data}
                renderItem={renderItem}
                keyExtractor={item => item._id}
            />
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
});

export default Products;