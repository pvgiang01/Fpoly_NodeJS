
import React, { useState, useEffect, useCallback } from 'react'
import firebase from '../utilities/firebaseDB'
import Home from './Home'
import SignUp from './SignUp'

const Loading = props => {
    const { navigation, route } = props
    const [isAuth, setIsAuth] = useState(route?.params?.isLoggedIn || false)
    
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
        return <Home navigation={navigation} />
    } else {
        return <SignUp navigation={navigation} />
    }
}

export default Loading