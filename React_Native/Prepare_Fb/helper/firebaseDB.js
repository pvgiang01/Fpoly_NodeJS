// database/firebaseDb.js

import * as firebase from 'firebase';
import firestore from 'firebase/firestore'

const  firebaseConfig = {
    apiKey: "AIzaSyB0GIULYZqhrZggsj76yZtspH1O56VAZVg",
    authDomain: "my21may21project.firebaseapp.com",
    // databaseURL: "https://my21may21project.firebaseio.com",
    projectId: "my21may21project",
    storageBucket: "my21may21project.appspot.com",
    messagingSenderId: "550765995121",
    appId: "1:550765995121:web:8fe5316f35c29ceebae7d0",
    measurementId: "G-366L3N7HH0"
  };

firebase.initializeApp(firebaseConfig);
firebase.firestore().settings({ experimentalForceLongPolling: true }); 
// firebase.firestore();

export default firebase;