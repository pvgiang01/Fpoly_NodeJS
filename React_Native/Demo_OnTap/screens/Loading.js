
import React, {useState, useEffect} from 'react'
import firebase from '../database/fbConfig'

import Home from './Home'
import Login from './Login'

const Loading = props => {
    const { navigation, route } = props
    const [isLoggedIn, setIsLoggedIn] = useState(route?.params?.isLoggedIn || false)

    useEffect(() => {
        firebase.auth().onAuthStateChanged(user => {
            if (user) {
                setIsLoggedIn(true)
            }
        })
    })
    
    if (isLoggedIn === true) {
        // chuyen sang man hinh Home
        return <Home navigation={navigation}/>
    } else {
        // chuyen sang man hinh Login
        return <Login navigation={navigation}/>
    }
}

export default Loading

