


import React, {useState, useEffect} from 'react'
import {Text, Image, TextInput,
    StyleSheet, View, FlatList, Button} from 'react-native'



const AddNew = props => {
    const [content, setContent] = useState('')
    const [avatar, setAvatar] = useState('')

    const save = () => {
        const data = {
            createdAt: new Date(),
            content: content,
            avatar: avatar
        }
        const option = {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify(data)
        }
        fetch('https://60ae432680a61f0017332d65.mockapi.io/api/v1/comments', option)
        .then(res => res.json())
        .then(json => console.log(json))
        .catch(err => console.log(err))
    }

    return(
        <>
            <Text>Nội dung</Text>
            <TextInput 
                value={content}
                onChangeText={setContent}
                placeholder='Nội dung'
            />
            <Text>Avatar</Text>
            <TextInput 
                value={avatar}
                onChangeText={setAvatar}
                placeholder='Nội dung'
            />
            <Button 
                title='Lưu'
                onPress={save}
            />
        </>
    )
}

export default AddNew