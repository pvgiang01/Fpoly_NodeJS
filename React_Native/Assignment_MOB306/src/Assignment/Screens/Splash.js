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
const Splash=({navigation})=>{
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
                <Text style={styles.title}>Stay connect with everyone!</Text>
                <Text style={styles.text}>Sign in with account</Text>
                <View stye={styles.button}>
                <TouchableOpacity style={styles.buttonContainer} 
                onPress={() => navigation.navigate('SignIn')}>
                    <Text style={styles.buttonText}>Get started</Text>
                </TouchableOpacity>
                </View>
                </Animatable.View>
            </View>
        )
}
export default Splash;
const {height} = Dimensions.get("screen");
const height_logo = height * 0.7 * 0.4;
var styles =StyleSheet.create({
    container:{
        flex:1,
        backgroundColor:'#6495ed'

    },
    header:{
        flex:2,
        justifyContent:'center',
        alignItems:'center'
    },
    footer:{
        flex:1,
        backgroundColor:'white',
        borderTopLeftRadius:30,
        borderTopRightRadius:30,
        paddingVertical:50,
        paddingHorizontal:30
    },
    logo:{
        width: height_logo,
        height: height_logo
    },
    title:{
        color: '#05375a',
        fontWeight:'bold',
        fontSize:30
    },
    text:{
        color:'gray',
        marginTop:5
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