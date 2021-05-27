import * as firebase from 'firebase';

// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const Config = {
  apiKey: "AIzaSyC6l-J41l8hKIzDqEK1n-d5TpKMZuiJnmA",
  authDomain: "chuonghtps11594-mob306.firebaseapp.com",
  databaseURL: "https://chuonghtps11594-mob306-default-rtdb.firebaseio.com",
  projectId: "chuonghtps11594-mob306",
  storageBucket: "chuonghtps11594-mob306.appspot.com",
  messagingSenderId: "783163784747",
  appId: "1:783163784747:web:fc9b497b88e999cd46346e",
  measurementId: "G-58JT12TK7Y"
};

export const firebaseConfig = firebase.initializeApp(Config);