
import React, { useState } from 'react';
import { Button, View, TextInput } from 'react-native';
import firebase from '../helper/firebaseDB';

const AddUserScreen = props => {
    const { navigation: { navigate } , route:{params:{count}}} = props
    const [title, setTitle] = useState('')
    const [body, setBody] = useState('')
    const add = async () => {
        try {
            await firebase.firestore()
            .collection('posts')
            .add({body, title, id: count+1})
            navigate('UserScreen')
        } catch (error) {
            console.log('>>>>>>>>>>', error)
        }       
    }
    return (
        <>
            <View>
                <TextInput
                    placeholder={'Title'}
                    value={title}
                    onChangeText={(val) => setTitle(val)}
                />
            </View>
            <View>
                <TextInput
                    multiline={true}
                    numberOfLines={4}
                    placeholder={'Body'}
                    value={body}
                    onChangeText={(val) => setBody(val)}
                />
            </View>
            <View>
                <Button
                    title="Add"
                    onPress={() => add()}
                    color="#19AC52"
                />
            </View>
            <View>
                <Button
                    title="Go to user list"
                    onPress={() => navigate('UserScreen')}
                    color="#19AC52"
                />
            </View>
        </>

    );
}



export default AddUserScreen;