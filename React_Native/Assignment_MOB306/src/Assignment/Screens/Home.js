import React from "react";
import{
    View,
    Text,
    StyleSheet,
    StatusBar,
    Dimensions,
    TouchableOpacity
} from "react-native";

import * as Animatable from 'react-native-animatable'
const Home=()=>{
        return(
            <View style={styles.container}>
                <StatusBar barStyle="Light-content"/>
                <View style={styles.header}>
                    <Animatable.Image
                    animation="bounceIn"
                    duration={1500}
                    source={require('../Image/logo.png')}
                    style={styles.logo}
                    resizeMode={"stretch"}
                    />
                </View>
                <Animatable.View 
                style={styles.footer}
                animation="fadeInUpBig">
                <Text style={styles.title}>About Us</Text>
                <Text style={styles.text}>Memphis is a store that provides all kinds of electronic devices from many different brands, diversified, good quality, reasonable price and especially good reputation.</Text>
                <Text style={styles.text}>Come to us to experience the best services with the best quality products.</Text>
                <View stye={styles.button}>
                </View>
                </Animatable.View>
            </View>
        )
}
export default Home;
const {height} = Dimensions.get("screen");
const height_logo = height * 0.7 * 0.4;
var styles =StyleSheet.create({
    container:{
        flex:1,
        backgroundColor:'#6495ed'

    },
    header:{
        flex:1,
        justifyContent:'center',
        alignItems:'center'
    },
    footer:{
        flex:2,
        backgroundColor:'white',
        borderTopLeftRadius:30,
        borderTopRightRadius:30,
        paddingVertical:10,
        paddingHorizontal:30,
        justifyContent:'center',
        alignItems:'center'
    },
    logo:{
        width: height_logo,
        height: height_logo
    },
    title:{
        color: '#05375a',
        fontWeight:'bold',
        fontSize:40
    },
    text:{
        color:'gray',
        marginTop:5,
        fontSize:20,
        textAlign:'center'
    },
    button:{
        alignItems:'flex-end',
        marginTop:30
    },
    buttonContainer :{
        width:150,
        height:40,
        backgroundColor:'#6495ed',
        alignItems:'center',
        justifyContent:'center',
        borderRadius:50,
        flexDirection:'row',
        marginTop:10,
        marginLeft:200

    },
    buttonText:{
        color:'#ffff',
        fontWeight:'bold',
    }
})