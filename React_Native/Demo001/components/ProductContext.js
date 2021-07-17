import React, { useState, useEffect, createContext, useContext } from 'react';

export const ProductContext = createContext();

export const ProductsContextProvider = ({ children }) => {
  const [restaurants, setRestaurants] = useState([]);

  const retrieveRestaurants = () => {  
    let res = [
        {id:1, name:'22'},
        {id:2, name:'22'},
        {id:3, name:'22'},
        {id:4, name:'22'},

    ]
    setRestaurants(res)
  };

  useEffect(() => {
    retrieveRestaurants();
  }, []);

  return (
    <ProductContext.Provider value={{ restaurants }}>
      {children}
    </ProductContext.Provider>
  );
};
