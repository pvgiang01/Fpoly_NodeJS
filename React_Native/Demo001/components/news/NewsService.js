import * as firebase from 'firebase';

export const getAllNews = (cb) => {
    firebase
      .firestore()
      .collection('news')
      .onSnapshot(res => {
        let arr = [];
        res.forEach(element => {
          const {id, images, title, content, created} = element.data();
          arr.push({id, images, title, content, created, key: element.id});
        });
        cb(arr);
      });
}

export const getAllCategories = (cb) => {
  firebase
    .firestore()
    .collection('categories')
    .onSnapshot(res => {
      let arr = [];
      res.forEach(element => {
        const {id, name} = element.data();
        arr.push({id, name, key: element.id});
      });
      cb(arr);
    });
}

export const deleteNews = async (key) => {
  try {
    await firebase.firestore().collection('news')
              .doc(key).delete()                
  } catch (error) {}
}

export const insertNews = (news) => {
  try {
    firebase.firestore().collection('news').add(news)
    .then(item => console.log('Insert success: ', item))
    .catch(err=> console.log('Error insert: ', err))
  } catch (error) {
    
  }
}

export const updateNews = (news) => {
  try {
    firebase.firestore().collection('news').doc(news.key).set(news)
    .then(item => console.log('Update success: ', item))
    .catch(err=> console.log('Error insert: ', err))
  } catch (error) {    
  }
}

export const uploadImg = async (img) => {
  if (!img) return;
  const {uri, fileName} = img
  const ref = firebase.storage().ref().child(fileName)

  const blob = await new Promise((resolve, reject) => {
    const xhr = new XMLHttpRequest();
    xhr.onload = function () {
        resolve(xhr.response);
    };
    xhr.onerror = function () {
        reject(new TypeError("Network request failed"));
    };
    xhr.responseType = "blob";
    xhr.open("GET", uri, true);
    xhr.send(null);
  });

  let mimeString = uri.split(':')[1]

  const snapshot = await ref.put(blob, {contentType: mimeString})
  const url = await snapshot.ref.getDownloadURL()
  return url;
}