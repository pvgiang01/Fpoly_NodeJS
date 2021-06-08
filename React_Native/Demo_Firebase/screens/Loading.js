
import React, { useState, useEffect, useCallback } from 'react'
import firebase from '../utilities/firebaseDB'
import Home from './Home'
import SignUp from './SignUp'
const Loading = props => {
    const { navigation } = props
    const [isAuth, setIsAuth] = useState(false)
    
    useEffect(() => {
        const subs = firebase.auth()
            .onAuthStateChanged(user => {
                console.log(user)
                if (user) {
                    setIsAuth(true)
                }
            })
        return subs
    }, [navigation])


    if (isAuth) {
        return <Home navigation={navigation} setIsAuth={setIsAuth}/>
    } else {
        return <SignUp navigation={navigation} setIsAuth={setIsAuth}/>
    }
}

export default Loading