import React, {useState, createContext} from 'react';
import * as firebase from 'firebase';

import { signIn, signOut, signUp } from './AccountService';

export const AccountContext = createContext();

export const AccountContextProvider = ({children}) => {
    const [user, setUser] = useState(null);

    firebase.auth().onAuthStateChanged((u) => {
        if (u) {
            setUser(u);
        }  
        else {
            setUser(null);
        }      
    })
    
    const onLogin = (email, password) => signIn(email, password)    

    const onLogout = () => signOut()

    const onRegister = (email, password) => signUp(email, password)

    return (
        <AccountContext.Provider 
            value={{
                isLoggedIn: !!user, // true/false
                onLogin,
                onLogout,
                onRegister
            }}
        >
            {children}
        </AccountContext.Provider>
    )
}


