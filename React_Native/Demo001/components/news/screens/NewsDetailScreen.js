import React, {useState, useContext} from 'react';
import {
  Text,
  TextInput,
  View,
  StyleSheet,
  Pressable,
  Alert,
  Modal,
  Image,
  ScrollView,
} from 'react-native';

import {NewsContext} from '../NewsContext';

export const NewsDetailScreen = props => {
  const {
    navigation,
    route: {
      params: {post},
    },
  } = props;

  const {onDelete, onUpdate} = useContext(NewsContext);

  const deleteItem = () => {
    onDelete(post.key);
    navigation.navigate('NewsListScreen');
  };

  const confirmDelete = () => {
    Alert.alert(
      'Cảnh báo!!!!',
      'Bạn có chắc muốn xóa hay không?',
      [
        {text: 'Có', onPress: deleteItem},
        {text: 'Không xóa', onPress: () => {}},
      ],
      {
        cancelable: true,
        onDismiss: () => {},
      },
    );
  };

  const [visible, setVisible] = useState(false);

  const [title, setTitle] = useState(post.title);
  const [content, setContent] = useState(post.content);
  const [images, setImages] = useState(post.images);

  const onSave = () => {
    let _post = {
      key: post.key,
      id: 1000,
      images:
        'https://cdn.tuoitre.vn/thumb_w/586/2021/7/22/pfizer-16269171195602110386169.jpg',
      title: title,
      content: content,
    };
    onUpdate(_post);
    setVisible(false);
    setTitle('');
    setContent('');
    navigation.navigate('NewsListScreen');
  };

  return (
    <>
      <ScrollView style={styles.container}>
        <Text style={styles.text}>New Detail Screen</Text>
        <Text style={styles.text}>{post.title}</Text>
        <Image style={styles.image} source={{uri: post.images}} />
        <Text style={styles.text}>{post.content}</Text>
        <Pressable style={styles.press} onPress={confirmDelete}>
          <Text style={styles.text}>Delete</Text>
        </Pressable>

        <Pressable style={styles.press} onPress={() => setVisible(true)}>
          <Text style={styles.text}>Update</Text>
        </Pressable>
      </ScrollView>

      <Modal animationType="slide" transparent={true} visible={visible}>
        <View style={styles.modal}>
          <Text style={styles.modalTitle}>Add new post</Text>
          <TextInput
            value={title}
            onChangeText={setTitle}
            multiline={true}
            numberOfLines={5}
            style={styles.textInput}
          />
          <TextInput
            value={content}
            onChangeText={setContent}
            multiline={true}
            numberOfLines={5}
            style={styles.textInput}
          />
          <View style={styles.buttons}>
            <Pressable
              style={styles.buttonContainer}
              onPress={() => setVisible(false)}>
              <Text style={styles.text}>Cancel</Text>
            </Pressable>
            <Pressable style={styles.buttonContainer} onPress={onSave}>
              <Text style={styles.text}>Save</Text>
            </Pressable>
          </View>
        </View>
      </Modal>
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
  press: {
    backgroundColor: 'red',
    width: 200,
    height: 50,
  },
  image: {
    width: 300,
    height: 100,
    resizeMode: 'cover',
  },
  container: {
    padding: 16,
    marginBottom: 32,
    paddingBottom: 32,
  },
  text: {
    fontSize: 40,
  },
});
