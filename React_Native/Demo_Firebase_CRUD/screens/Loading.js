
import React, { useState, useEffect } from 'react'
import {ActivityIndicator, View} from 'react-native'

import firebase from '../database/config'

import Home from './Home'
import SignUp from './SignUp'

const Loading = props => {
    const {navigation} = props
    const [isAuth, setIsAuth] = useState(null)
    // useEffect(() => {
    //     firebase.auth()
    //     .onAuthStateChanged(user => {
    //         if (user) {
    //             setIsAuth(true)
    //         }
    //         else {
    //             setIsAuth(false)
    //         }
    //     })        
    // }, [isAuth])
    return <Home {...navigation}/>
    
    // if (isAuth === null) {
    //     return (
    //         <View>
    //             <ActivityIndicator size='large' color='red'/>   
    //         </View>
    //     )     
    // } else {
    //     if (isAuth === true) {
    //         // chạy qua Home
    //         return <Home {...navigation}/>
    //     } else {
    //         // chạy qua SignUp
    //         return <SignUp {...navigation}/>
    //     }
    // }
    // spread operator
}

export default Loading