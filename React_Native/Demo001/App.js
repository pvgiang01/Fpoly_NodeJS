import React, {useState} from 'react';
import {Text, View, StyleSheet, Button} from 'react-native'
import * as firebase from 'firebase';
import { AuthenticationContextProvider } from './components/AuthenticationContext';
import { Navigation } from './components/navigation';

const firebaseConfig = {
  apiKey: "AIzaSyB0GIULYZqhrZggsj76yZtspH1O56VAZVg",
  authDomain: "my21may21project.firebaseapp.com",
  projectId: "my21may21project",
  storageBucket: "my21may21project.appspot.com",
  messagingSenderId: "550765995121",
  appId: "1:550765995121:web:8fe5316f35c29ceebae7d0",
  measurementId: "G-366L3N7HH0"
};

if (!firebase.apps.length) {
  firebase.initializeApp(firebaseConfig);
}

const App = () => {  

  return (
    <>
     <AuthenticationContextProvider>
            <Navigation />
          </AuthenticationContextProvider>
    </>
  )
}

export default App






// lab 1: set up env




// lab 2: Crazy math



// lab 3: firebase, navigation
// show flat list, image, scroll view, detail




// lab 4: