import React, { useState } from 'react';
import {Text} from 'react-native';

const Hello = (props) => {   
    const [id, setId] = useState(0)
    const [name, setName] = useState(props.prop_name)

    const xuLySuKien = () => {
        const count = id + 1
        setId(count)
    }
    const xuLySuKienName = () => {
        const newName = 'Trần Văn C'
        setName(newName)
    }
    return (
      <>
        <Text onPress={xuLySuKienName}>Hello {name}</Text>
        <Text onPress={() => props.suKien('Nguyễn Khánh Nam')}>Hello {props.prop_name}</Text>
        <Text onPress={xuLySuKien}>State: {id}</Text>
      </>
    )  
  }

export default Hello