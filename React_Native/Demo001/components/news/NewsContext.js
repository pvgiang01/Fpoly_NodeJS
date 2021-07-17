import React, {useState, createContext, useEffect} from 'react';
import * as firebase from 'firebase';

export const NewsContext = createContext();

export const NewsContextProvider = ({children}) => {
  const [data, setData] = useState([]); // data: danh sach tin tuc tu firebase

  // get all new from firebase
  const onGet = () => {
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
  };

  // add new to firebase
  const onAddNew = () => {};

  // delete
  const onDelete = id => {};

  // update
  const onUpdate = () => {};

  useEffect(() => {
    onGet();
  }, []);

  return (
    <NewsContext.Provider value={{data, onAddNew, onUpdate, onDelete}}>
      {children}
    </NewsContext.Provider>
  );
};
