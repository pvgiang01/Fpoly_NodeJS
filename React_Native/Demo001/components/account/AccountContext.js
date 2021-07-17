import React, {useState, createContext} from 'react';
import * as firebase from 'firebase';




export const AccountContext = createContext();

export const AccountContextProvider = ({children}) => {
    const [user, setUser] = useState(null);

    firebase.auth().onAuthStateChanged((u) => {
        if (u) setUser(u);
    })

    const onLogin = (email, password) => {

    }

    const onLogout = () => {

    }

    const onRegister = (email, password, confirmPassword) => {

    }

    return (
        <AccountContext.Provider 
            value={{
                isLoggedIn: true,
                onLogin,
                onLogout,
                onRegister
            }}
        >
            {children}
        </AccountContext.Provider>
    )
}


