import React, {useState, useContext} from 'react';
import {Text, View, StyleSheet, Pressable} from 'react-native';
import {NewsContext} from '../NewsContext';

export const NewsListScreen = props => {
  const {data} = useContext(NewsContext);
  console.log('>>>>>>', data);
  // dung FlatList
  return (
    <>
      <Text style={styles.text}>New List Screen</Text>
    </>
  );
};

const styles = StyleSheet.create({
  text: {
    fontSize: 40,
  },
});
