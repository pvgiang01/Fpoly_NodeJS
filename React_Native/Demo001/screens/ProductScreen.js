import React, {useState, useContext} from 'react'
import {Text, View, StyleSheet, Button} from 'react-native';

import { ProductContext } from '../components/ProductContext';

export const ProductScreen = props => {   

    const { restaurants } = useContext(ProductContext);

    console.log(restaurants);
    return (
        <>
           <Text>ProductScreen</Text>
        </>
    )
}

// export default ProductScreen

const styles = StyleSheet.create({
    text:{
        fontSize: 40
    }
})