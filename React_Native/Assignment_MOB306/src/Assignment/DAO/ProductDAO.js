import { ToastAndroid } from "react-native";
import { firebaseConfig } from '../Firebase/Firebase';
module.exports.delete = (key) => {
  firebaseConfig
    .database()
    .ref()
    .child("DSSV")
    .child(key)
    .remove()
    .then(() => {
      console.log("Delete success!");
      ToastAndroid.show("Delete success!", ToastAndroid.SHORT);
    })
    .catch((error) => {
      console.log("Delete fail!");
      ToastAndroid.show("Delete success!", ToastAndroid.SHORT);
    });
};
module.exports.update = async (key, name, mssv, nganh, image) => {
  const remoteUri = await _uploadImage(name, image);
  firebaseConfig
    .database()
    .ref()
    .child("DSSV")
    .child(key)
    .set({
      name: name,
      mssv: mssv,
      nganh: nganh,
      image: remoteUri,
    })
    .then(() => {
      console.log("Update success!");
      ToastAndroid.show("Update success!", ToastAndroid.SHORT);
    })
    .catch((error) => {
      console.log("Update fail!");
      ToastAndroid.show("Update success!", ToastAndroid.SHORT);
    });
};

const _uploadImage = async (name, uri) => {
  const path = "images/" + name + ".jpg";
  return new Promise(async (res, rej) => {
    const response = await fetch(uri);
    const file = await response.blob();

    let upload = firebaseConfig.storage().ref(path).put(file);

    upload.on(
      "state_changed",
      (snapshot) => {},
      (err) => {
        rej(err);
      },
      async () => {
        const url = await upload.snapshot.ref.getDownloadURL();
        res(url);
      }
    );
  });
};

module.exports.insert = async (name, mssv, nganh, image) => {
  const remoteUri = await _uploadImage(name, image);
  firebaseConfig
    .database()
    .ref()
    .child("DSSV")
    .push({
      name: name,
      mssv: mssv,
      nganh: nganh,
      image: remoteUri,
    })
    .then(() => {
      console.log("Insert success!");
      ToastAndroid.show("Insert success!", ToastAndroid.SHORT);
    })
    .catch((error) => {
      console.log("Insert fail!");
      ToastAndroid.show("Insert success!", ToastAndroid.SHORT);
    });
};