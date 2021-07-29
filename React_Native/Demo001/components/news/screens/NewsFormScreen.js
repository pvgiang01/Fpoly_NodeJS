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
import DateTimePickerModal from "react-native-modal-datetime-picker";

export const NewsFormScreen = props => {
  const {navigation} = props;
  const {news, categories, onAddNew} = useContext(NewsContext);

  const [title, setTitle] = useState('');
  const [content, setContent] = useState('');
  const [images, setImages] = useState('');

  const [selectedCategory, setSelectedCategory] = useState(null);

  const [dateTimeModalVisible, setdateTimeModalVisible] = useState(false)
  const [dateTimeValue, setDateTimeValue] = useState(null)

  const onSave = () => {
    let post = {
      id: 1000,
      images:
        'https://cdn.tuoitre.vn/thumb_w/586/2021/7/22/pfizer-16269171195602110386169.jpg',
      title: title,
      content: content,
      category: {
          id: selectedCategory.id,
          name: selectedCategory.name
      },
      created: dateTimeValue
    };
    onAddNew(post);
    setTitle('');
    setContent('');
    navigation.navigate('NewsListScreen')
  };

  console.log(dateTimeValue)

  return (
    <>
      <Text style={styles.text}>News Form Screen</Text>
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
      <Picker
        selectedValue={selectedCategory}
        onValueChange={(itemValue, itemIndex) =>
          setSelectedCategory(itemValue)
        }>
        {categories.map(item => (
          <Picker.Item key={item.key} label={item.name} value={item} />
        ))}
      </Picker>

        <Pressable
          style={styles.buttonContainer}
          onPress={() => setdateTimeModalVisible(true)}>
          <Text style={styles.text}>Choose date</Text>
        </Pressable>

        <DateTimePickerModal
            isVisible={dateTimeModalVisible}
            mode="date"
            onConfirm={(date) => { setDateTimeValue(date); setdateTimeModalVisible(false);}}
            onCancel={() => setdateTimeModalVisible(false)}
        />

      <View style={styles.buttons}>
        <Pressable
          style={styles.buttonContainer}
          onPress={() => navigation.navigate('NewsListScreen')}>
          <Text style={styles.text}>Cancel</Text>
        </Pressable>
        <Pressable style={styles.buttonContainer} onPress={onSave}>
          <Text style={styles.text}>Save</Text>
        </Pressable>
      </View>
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
