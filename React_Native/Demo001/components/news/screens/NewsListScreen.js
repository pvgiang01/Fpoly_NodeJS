import React, { useState, useContext } from 'react';
import { Text, View, StyleSheet, Pressable, FlatList } from 'react-native';
import { NewsContext } from '../NewsContext';

export const NewsListScreen = props => {
  const { navigation } = props
  const { data } = useContext(NewsContext);
  
  const renderItem = ({ item }) => {
    return (
      <View style={styles.container}>
        <Pressable onPress={() =>
          navigation.navigate('NewsDetailScreen', { post: item })}>
          <Text style={styles.text}>{item.title}</Text>
        </Pressable>
      </View>
    )
  }

  // dung FlatList
  return (
    <>
      <Text style={styles.text}>New List Screen</Text>
      <FlatList
        data={data}
        renderItem={renderItem}
        keyExtractor={item => item.key}
      />
    </>
  );
};

const styles = StyleSheet.create({
  container: {
    backgroundColor: 'grey',
    margin: 8
  },
  text: {
    fontSize: 40,
  },
});
