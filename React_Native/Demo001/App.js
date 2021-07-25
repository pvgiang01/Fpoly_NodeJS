import React, {useState} from 'react';
import * as firebase from 'firebase';
import { AccountContextProvider } from './components/account/AccountContext';
import { Navigation } from './components/navigation/index';

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
  firebase.firestore().settings({ experimentalForceLongPolling: true });
}

const App = () => {  

  return (
    <>
     <AccountContextProvider>
            <Navigation />
      </AccountContextProvider>
    </>
  )
}

export default App






// lab 1: set up env




// lab 2: Crazy math



// lab 3: firebase, navigation
// show flat list, image, scroll view, detail




// lab 4: firebase, navigation
// show flat list, image, scroll view, detail
// xóa, confirm, thêm mới, cập nhật



// lab 5: sign in, sign up

