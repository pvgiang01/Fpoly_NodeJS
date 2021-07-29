import React, {useState, useContext} from 'react';
import {
  Text,
  View,
  StyleSheet,
  Modal,
  Pressable,
  FlatList,
  TextInput,
} from 'react-native';
import {Picker} from '@react-native-picker/picker';
import {NewsContext} from '../NewsContext';
import {AccountContext} from '../../account/AccountContext';

export const NewsListScreen = props => {
  const {navigation} = props;
  const {news, categories, onAddNew} = useContext(NewsContext);
  const {onLogout} = useContext(AccountContext);
  const [visible, setVisible] = useState(false);

  const [title, setTitle] = useState('');
  const [content, setContent] = useState('');
  const [images, setImages] = useState('');

  const renderItem = ({item}) => {
    return (
      <View style={styles.container}>
        <Pressable
          onPress={() => navigation.navigate('NewsDetailScreen', {post: item})}>
          <Text style={styles.text}>{item.title}</Text>
        </Pressable>
      </View>
    );
  };

  const onSave = () => {
    let post = {
      id: 1000,
      images:
        'https://cdn.tuoitre.vn/thumb_w/586/2021/7/22/pfizer-16269171195602110386169.jpg',
      title: title,
      content: content,
    };
    onAddNew(post);
    setVisible(false);
    setTitle('');
    setContent('');
  };

  // dung FlatList
  return (
    <>
      <Text style={styles.text}>New List Screen</Text>
      <View>
        <Pressable
          style={styles.buttonContainer}
          onPress={() => navigation.navigate('NewsFormScreen')}>
          <Text style={styles.text}>Add new</Text>
        </Pressable>
        <Pressable style={styles.buttonContainer} onPress={() => onLogout()}>
          <Text style={styles.text}>Log Out</Text>
        </Pressable>
      </View>
      <FlatList
        data={news}
        renderItem={renderItem}
        keyExtractor={item => item.key}
      />
    </>
  );
};

const styles = StyleSheet.create({
  buttons: {
    flexDirection: 'row',
  },
  modalTitle: {
    fontSize: 30,
    color: 'white',
  },
  textInput: {
    width: '80%',
    height: 50,
    backgroundColor: 'white',
    margin: 16,
    fontSize: 30,
  },
  modal: {
    backgroundColor: '#3285a8',
    height: '80%',
    margin: 20,
    padding: 8,
    borderRadius: 20,
    shadowColor: '#000',
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.25,
    shadowRadius: 4,
    elevation: 5,
    alignItems: 'center',
    paddingTop: 24,
  },
  buttonContainer: {
    width: '50%',
    height: 50,
    backgroundColor: 'red',
  },
  container: {
    backgroundColor: 'grey',
    margin: 8,
  },
  text: {
    fontSize: 40,
  },
});
