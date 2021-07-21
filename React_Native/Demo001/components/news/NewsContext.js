import React, {useState, createContext, useEffect} from 'react';

import { getAllNews, deleteNews, insertNews, updateNews } from './NewsService';


export const NewsContext = createContext();

export const NewsContextProvider = ({children}) => {
  const [data, setData] = useState([]); // data: danh sach tin tuc tu firebase

  // get all new from firebase
  const onGet = () => { getAllNews(setData) };

  // add new to firebase
  const onAddNew = (news) => { insertNews(news) };

  // delete
  const onDelete = async (key) => { await deleteNews(key) };

  // update
  const onUpdate = (news) => { updateNews(news) };

  useEffect(() => {
    onGet();
  }, []);

  return (
    <NewsContext.Provider value={{data, onAddNew, onUpdate, onDelete}}>
      {children}
    </NewsContext.Provider>
  );
};
