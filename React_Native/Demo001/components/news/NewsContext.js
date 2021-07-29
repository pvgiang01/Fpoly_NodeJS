import React, {useState, createContext, useEffect} from 'react';

import { getAllNews, deleteNews, insertNews, updateNews, getAllCategories, uploadImg } from './NewsService';


export const NewsContext = createContext();

export const NewsContextProvider = ({children}) => {
  const [news, setNews] = useState([]); // news: danh sach tin tuc tu firebase
  const [categories, setCategories] = useState([]) // danh sach categories 

  // get all new from firebase
  const onGet = () => { getAllNews(setNews) };

  // get all categories
  const onGetCategories = () => getAllCategories(setCategories)

  // add new to firebase
  const onAddNew = (news) => { insertNews(news) };

  // delete
  const onDelete = async (key) => { await deleteNews(key) };

  // update
  const onUpdate = (news) => { updateNews(news) };

  // upload image to firebase storage
  const upload = async (img) => await uploadImg(img)

  useEffect(() => {
    onGet();
    onGetCategories();
  }, []);

  return (
    <NewsContext.Provider value={{news, categories, onAddNew, onUpdate, onDelete, upload}}>
      {children}
    </NewsContext.Provider>
  );
};
