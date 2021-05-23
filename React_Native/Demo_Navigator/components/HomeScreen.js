
import * as React from 'react'

import { Button } from 'react-native'



const HomeScreen = (props) => {
    const {navigation:{navigate}} = props
    const myParams = {name: 'Nguyen Van Anh', age: 18}
    return (
        <>
            <Button 
                title="Go to Hello Screen"
                onPress={() => navigate('HelloScreen', myParams)}
            />
            <Button
                title="Go to FlatList Screen"
                onPress={() => navigate('FlatListScreen')}
            />
        </>
    )
}

export default HomeScreen

