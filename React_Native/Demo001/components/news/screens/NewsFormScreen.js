import React, {useState, useContext} from 'react';
import {Text,View,StyleSheet,Modal,Pressable, FlatList,
  TextInput, Image
} from 'react-native';
import {Picker} from '@react-native-picker/picker';
import {NewsContext} from '../NewsContext';
import {AccountContext} from '../../account/AccountContext';
import DateTimePickerModal from 'react-native-modal-datetime-picker';
import {launchCamera, launchImageLibrary} from 'react-native-image-picker';



export const NewsFormScreen = props => {
  const {navigation, route} = props;
  const {news, categories, onAddNew, upload} = useContext(NewsContext);

  const [title, setTitle] = useState(route?.params?.post ? route.params.post.title : '' );
  const [content, setContent] = useState(route?.params?.post ? route.params.post.content : '');
  const [images, setImages] = useState(null);
  const [imageURL, setImageURL] = useState(route?.params?.post ? route.params.post.images : null)

  const [selectedCategory, setSelectedCategory] = useState(null);

  const [dateTimeModalVisible, setdateTimeModalVisible] = useState(false);
  const [dateTimeValue, setDateTimeValue] = useState(route?.params?.post ? route.params.post.created : null);

  const onSave = () => {
    let post = {
      id: 1000,
      images: imageURL,     
      title: title,
      content: content,
      category: {
        id: selectedCategory.id,
        name: selectedCategory.name,
      },
      created: dateTimeValue,
    };
    onAddNew(post);
    setTitle('');
    setContent('');
    navigation.navigate('NewsListScreen');
  };

  const displayDateTime = date => {
    console.log('====>',date);
    if (!date) {
      date = new Date();
    } else {
      if (!(date instanceof Date)) {
        date = new Date(date.toDate())
      }      
    }    
    let month = date.getMonth() + 1;
    month = month.toString().length == 1 ? '0' + month : month;
    let year = date.getFullYear();
    let day =
      date.getDate().toString().length == 1
        ? '0' + date.getDate().toString()
        : date.getDate().toString();
    return day + '/' + month + '/' + year;
  };

  const onTakePhoto = () => {
    let options = {
      maxHeight: 250,
      maxWidth: 350,
      saveToPhotos: true
    }
    launchCamera(options, async (res) => {
      if (res.assets) {
        setImages(res.assets[0])
        const url = await upload(res.assets[0])
        setImageURL(url)
      } else {
        console.log('>>>>>launchCamera error')
      }
    })
  }

  return (
    <>
      <View style={styles.formContainer}>
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
        <View>
          <Picker
            selectedValue={selectedCategory}
            onValueChange={(itemValue, itemIndex) =>
              setSelectedCategory(itemValue)
            }>
            {categories.map(item => (
              <Picker.Item
                style={{fontSize: 25}}
                key={item.key}
                label={item.name}
                value={item}
              />
            ))}
          </Picker>
        </View>

        <Pressable onPress={() => setdateTimeModalVisible(true)}>
          <Text style={styles.dateSelection}>
            Choose date: {displayDateTime(dateTimeValue)}
          </Text>
        </Pressable>

        <DateTimePickerModal
          isVisible={dateTimeModalVisible}
          mode="date"
          onConfirm={date => {
            setDateTimeValue(date);
            setdateTimeModalVisible(false);
          }}
          onCancel={() => setdateTimeModalVisible(false)}
        />

        <Pressable onPress={onTakePhoto}>
          <Text style={styles.dateSelection}>Take photo</Text>
        </Pressable>

        <Image
          source={{uri: imageURL}}
          style={{width: 200, height: 200, resizeMode: 'cover'}}
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
      </View>
    </>
  );
};

const styles = StyleSheet.create({
  dateSelection: {
    fontSize: 25,
  },
  formContainer: {
    backgroundColor: '#809c97',
    margin: 16,
    padding: 16,
    // alignItems: 'center'
  },
  buttons: {
    marginTop: 16,
    flexDirection: 'row',
  },
  modalTitle: {
    fontSize: 30,
    color: 'white',
  },
  textInput: {
    width: '100%',
    height: 50,
    backgroundColor: 'white',
    marginTop: 16,
    marginBottom: 16,
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
