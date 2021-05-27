import React, { useEffect, useState } from "react";
import {
  View,
  Text,
  StyleSheet,
  Dimensions,
  FlatList,
  Alert,
  TouchableOpacity,
  TouchableWithoutFeedback,
  Image,
  Modal,
  TextInput,
  ToastAndroid,
  LogBox,
  StatusBar,
  DrawerLayoutAndroidComponent,
} from "react-native";

import { firebaseConfig } from '../Firebase/Firebase';
import * as ImagePicker from "expo-image-picker";
import Swipeout from "react-native-swipeout";
import ProductDAO from "../DAO/ProductDAO";

import * as Animatable from 'react-native-animatable'
import socketIOClient from "socket.io-client";
const ENDPOINT = "http://172.20.10.2:3000";
const socket = socketIOClient(ENDPOINT);

const DSSV = () => {
  const itemsRef = firebaseConfig.database().ref().child("DSSV");
  const  [txtSearch, setTxtSearch] = useState("");
  const [lists, setLists] = useState([]);
  const [modalVisible, setModalVisible] = useState(false);
  const [currentItem, setCurrentItem] = useState(null);
  _hideDialog = () => {
    setModalVisible(false);
  };
  _showDialog = () => {
    setModalVisible(true);
  };
  _setCurrent = async (item) => {
    await setCurrentItem(item);
  };

  // Function add Product vao lists
  const listenForItems = (itemsRef) => {
    // var items = [];
    socket.emit("getStudent","sshhh");
    socket.on("getStudent", student =>{
      console.log(student);
    });
    
    itemsRef.on("value", (snap) => {
      var items = [];
      snap.forEach((child) => {
        let item = {
          key: child.key,
          name: child.val().name,
          mssv: child.val().mssv,
          nganh: child.val().nganh,
          image: child.val().image,
        };
        items.push(item);
      });

      setLists(items);
    });
  };
  const FilterData = () => {

    if(txtSearch == ""){
      listenForItems(itemsRef);
    }else{
      itemsRef.on("value",(snapshot) =>{
        var items = [];
        snapshot.forEach((child) => {
            let item = {
              key: child.key,
              name: child.val().name,
              mssv: child.val().mssv,
              nganh: child.val().nganh,    
              image: child.val().image,
            };
            if(item.mssv.includes(txtSearch)){
              items.push(item);
            }
        })
        setLists(items);
    });
    }
  }
  useEffect(() => {
    console.log(txtSearch);
    FilterData();
    //Tat warning khong can thiet
    LogBox.ignoreLogs(["Setting a timer", "Warning:"]);
  }, [txtSearch]);

  //
  return (
    <View style={styles.container}>
      <StatusBar barStyle="Light-content"/>
        <View style={styles.header}>
            <Animatable.Text
            animation="bounceIn"
            duration={1500}
            resizeMode={"stretch"}
            >
              <Text style={styles.title}>DANH SÁCH SINH VIÊN</Text>
            </Animatable.Text>
        </View>
      <Animatable.View 
      style={styles.footer}
      animation="fadeInUpBig">
                <View style={{flexDirection: "row"}}>
                <TextInput style={styles.input} 
                    placeholder="Search mssv..." 
                    onChangeText={(text)=>{setTxtSearch(text)
                      }}
                        />
                </View>
              <FlatList
        scrollEnabled={true}
        style={styles.flatList}
        data={lists}
        renderItem={({ item }) => (
          <ProductItem
            item={item}
            _showDialog={_showDialog}
            _setCurrent={_setCurrent}
          />
        )}
      />
      </Animatable.View>
      


      <TouchableOpacity
        style={styles.fab}
        onPress={() => {
          _setCurrent(null);
          _showDialog();
        }}
      >
        <Text style={styles.text}>+</Text>
      </TouchableOpacity>
      <Modal animationType="slide" transparent={true} visible={modalVisible}>
        <ProductInsUp item={currentItem} _hideDialog={_hideDialog} />
      </Modal>
    </View>
  );
};
//Insert Update Product function
const ProductInsUp = (props) => {
  const [item] = useState(props.item);
  const [isInsert] = useState(item == null);
  const [key, setKey] = useState("");
  const [name, setName] = useState("");
  const [mssv, setMssv] = useState("");
  const [nganh, setNganh] = useState("");
  const [image, setImage] = useState("https://reactjs.org/logo-og.png");

  //function chọn ảnh
  const _chooseImage = async () => {
    const result = await ImagePicker.launchImageLibraryAsync({
      mediaTypes: ImagePicker.MediaTypeOptions.Images,
      allowsEditing: true,
      aspect: [4, 3],
    });

    if (!result.cancelled) {
      setImage(result.uri);
      console.log(image);
    }
  };

  //fuction useEffect
  useEffect(() => {
    if (!isInsert) {
      setKey(props.item.key);
      setName(props.item.name);
      setMssv(props.item.mssv);
      setNganh(props.item.nganh);
      setImage(props.item.image);
    }
  }, []);

  return (
    <View style={styles.centeredView}>
      <View style={styles.modalView}>
        <Text style={styles.modalText}>
          {isInsert ? "Insert" : "Update"} DANH SÁCH SINH VIÊN
        </Text>
        <TouchableWithoutFeedback onPress={() => _chooseImage()}>
          <Image
            source={{ uri: image, width: 150, height: 150 }}
            style={{ borderWidth: 1, borderColor: "black" }}
          />
        </TouchableWithoutFeedback>
        <View style={styles.lineDialog}>
          <Text style={styles.textDialog}>Tên: </Text>
          <TextInput
            style={styles.textInputDialog}
            value={name}
            onChangeText={(text) => setName(text)}
          />
        </View>

        <View style={styles.lineDialog}>
          <Text style={styles.textDialog}>MSSV: </Text>
          <TextInput
            style={styles.textInputDialog}
            value={mssv}
            onChangeText={(text) => setMssv(text)}
          />
        </View>

        <View style={styles.lineDialog}>
          <Text style={styles.textDialog}>Ngành: </Text>
          <TextInput
            style={styles.textInputDialog}
            value={nganh}
            onChangeText={(text) => setNganh(text)}
          />
        </View>

        <View style={styles.openButtonGroup}>
          <TouchableOpacity
            style={{ ...styles.openButton, backgroundColor: "#2196F3" }}
            onPress={() => {
              props._hideDialog();
            }}
          >
            <Text style={styles.textStyle}>Cancel</Text>
          </TouchableOpacity>
          <TouchableOpacity
            style={{ ...styles.openButton, backgroundColor: "#2196F3" }}
            onPress={() => {
              props._hideDialog();
              isInsert
                ? ProductDAO.insert(name, mssv, nganh, image)
                : ProductDAO.update(key, name, mssv, nganh, image);
            }}
          >
            <Text style={styles.textStyle}>
              {isInsert ? "Insert" : "Update"}
            </Text>
          </TouchableOpacity>
        </View>
      </View>
    </View>
  );
};
//Item FlatList & Delete function
const ProductItem = (props) => {
  const swipeoutSettings = {
    autoClose: true,
    onClose: () => { },
    onOpen: () => {
      props._setCurrent(props.item);
    },
    right: [
      {
        text: "Update",
        type: "secondary",
        onPress: () => {
          props._showDialog();
        },
      },
      {
        text: "Delete",
        type: "delete",
        onPress: () => {
          Alert.alert(
            "Delete",
            "Are you want to delete SV " + props.item.name + "?",
            [
              {
                text: "No",
                onPress: () => console.log("Cancel Delete "),
                type: "cancel",
              },
              { text: "Yes", onPress: () => ProductDAO.delete(props.item.key) },
            ],
            { cancelable: true }
          );
        },
      },
    ],
  };

  return (
    <Swipeout {...swipeoutSettings} style={styles.swipeOut}>
      <View style={styles.listContainer}>
        <Image
          source={{ uri: props.item.image, width: 60, height: 60 }}
          style={{ borderWidth: 1, borderColor: "black" }}
        />
        <View>
          <Text style={{ marginLeft: 10, fontSize: 20 }}>
            Name: {props.item.name}
          </Text>
          <Text style={{ marginLeft: 10 }}>
            MSSV: {props.item.mssv}
          </Text>
          <Text style={{ marginLeft: 10 }}>Ngành: {props.item.nganh}</Text>
        </View>
      </View>
    </Swipeout>
  );
};

const { width, height } = Dimensions.get("window");
const styles = StyleSheet.create({
container:{
    flex:1,
    backgroundColor:'#6495ed'
},
input: {
  padding: 10,
  marginBottom: 20,
  marginLeft: 5,
  width: width -10,
  height: height / 15,
  fontSize: 16,
  borderRadius: 8,
  borderWidth: 1,
  justifyContent:'center',
  alignItems:'center'
},
buttonContainer :{
  width:width -340,
  padding: 10,
  height: height / 15,
  backgroundColor:'#6495ed',
  alignItems:'center',
  justifyContent:'center',
  borderRadius:50,
  flexDirection:'row',
  borderRadius: 8,
  borderWidth: 1,
  marginLeft:10

},
header:{
  flex:1,
  justifyContent:'center',
  alignItems:'center'
},
footer:{
  flex:2,
  backgroundColor:'white',
  borderTopLeftRadius:30,
  borderTopRightRadius:30,
  paddingVertical:50,

},
title:{
  color:'#ffff',
  fontSize: 30,
  justifyContent:'center',
  alignItems:'center',
  marginBottom: 20,
  fontWeight:'bold'
},

  flatList: {
    height: "100%",
    backgroundColor:'white'
    
  },

  swipeOut: {},
  listContainer: {
    backgroundColor: 'white',
    flexDirection: "row",
    marginTop: 1,
    padding: (width * 3.6) / 187.5,
  },

  fab: {
    height: 50,
    width: 50,
    borderRadius: 200,
    position: "absolute",
    bottom: 20,
    right: 20,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "gray",
  },

  centeredView: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    marginTop: 22,
  },
  modalView: {
    width: (width * 167.5) / 187.5,
    padding: (width * 8) / 187.5,
    borderRadius: (width * 3.6) / 187.5,
    margin: 20,
    backgroundColor: "white",
    alignItems: "center",
    shadowColor: "#000",
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.25,
    shadowRadius: 3.84,
    elevation: 5,
  },
  openButtonGroup: {
    width: "100%",
    height: 40,
    margin: 8,
    flexDirection: "row",
    alignItems: "center",
    justifyContent: "center",
  },
  openButton: {
    backgroundColor: "#F194FF",
    borderRadius: 20,
    padding: 10,
    paddingHorizontal: 20,
    margin: 2,
    elevation: 2,
  },
  textStyle: {
    color: "white",
    fontWeight: "bold",
    textAlign: "center",
  },
  modalText: {
    fontSize: 20,
    marginBottom: 15,
    textAlign: "center",
  },
  lineDialog: {
    width: "100%",
    height: 40,
    margin: 8,
    flexDirection: "row",
    alignItems: "center",
    borderWidth: 1,
    borderRadius: 5,
    paddingHorizontal: 5,
    backgroundColor: "#f1f1f1",
  },
  textDialog: {},
  textInputDialog: {
    height: 34,
    flex: 1,
    marginRight: 4,
    borderWidth: 0,
    borderRadius: 5,
    color: "#111111",
    fontSize: 15,
    paddingLeft: 5,
  },
});

export default DSSV;
