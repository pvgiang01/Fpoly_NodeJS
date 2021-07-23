import * as firebase from 'firebase';

export const getAllNews = (setData) => {
    firebase
      .firestore()
      .collection('news')
      .onSnapshot(res => {
        let arr = [];
        res.forEach(element => {
          const {id, images, title, content} = element.data();
          arr.push({id, images, title, content, key: element.id});
        });
        setData(arr);
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