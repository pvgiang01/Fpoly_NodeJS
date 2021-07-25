import * as firebase from 'firebase';

export const signIn = async (email, password) => {
  await firebase
    .auth()
    .signInWithEmailAndPassword(email, password); 
};

export const signUp = async (email, password) => {
  await firebase
    .auth()
    .createUserWithEmailAndPassword(email, password);
};

export const signOut = async () => {
 await firebase.auth().signOut();
};
