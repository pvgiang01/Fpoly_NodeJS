import * as firebase from 'firebase';

export const login = async (email, password) => {
    let status = await firebase.auth()
                    .signInWithEmailAndPassword(email, password)
    return status
  }
  
  export const register = () => {
    
  }





