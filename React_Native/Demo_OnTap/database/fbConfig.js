

import * as firebase from 'firebase'

const firebaseConfig = {
    apiKey: "AIzaSyB0GIULYZqhrZggsj76yZtspH1O56VAZVg",
    authDomain: "my21may21project.firebaseapp.com",
    projectId: "my21may21project",
    storageBucket: "my21may21project.appspot.com",
    messagingSenderId: "550765995121",
    appId: "1:550765995121:web:8fe5316f35c29ceebae7d0",
    measurementId: "G-366L3N7HH0"
};
// Initialize Firebase
firebase.initializeApp(firebaseConfig);
firebase.firestore().settings({experimentalForceLongPolling: true})

export default firebase
