import React,{ useState } from "react";
import{
    View,
    Text,
    StyleSheet,
    ToastAndroid,
    StatusBar,
    Dimensions,
    TouchableOpacity,
    TextInput,
} from "react-native";
import * as Animatable from 'react-native-animatable'
import { firebaseConfig } from '../Firebase/Firebase';

//socket
import socketIOClient from "socket.io-client";
const ENDPOINT = "172.20.10.2:3000";
const socket = socketIOClient(ENDPOINT);


const SignIn=({navigation})=>{
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    
    const _register = async (email, password) => {
        await 
        socket.emit("register", email,password);
        //
        await 

        socket.on("register", (result) => {
            console.log(result);
            if(result === true){
                navigation.navigate('SignUp');
            }
        })
      };
        return(
            <View style={styles.container}>
                <StatusBar barStyle="Light-content"/>
                <View style={styles.header}>
                    <Animatable.Text
                    animation="bounceIn"
                    duration={1500}
                    resizeMode={"stretch"}
                    >
                        <Text style={styles.text}>Register Screen</Text>
                    </Animatable.Text>
                </View>
                <Animatable.View 
                style={styles.footer}
                animation="fadeInUpBig">
                    <Text>Already have an account?</Text>
                    <TextInput style={styles.input}
                        value={email}
                        placeholder="Email"
                        onChangeText={(text) => setEmail(text)} />
                    <TextInput style={styles.input}
                        value={password}
                        placeholder="Password"
                        onChangeText={(text) => setPassword(text)}
                        secureTextEntry={true} />
                    <TouchableOpacity style={styles.buttonContainer}
                        onPress={() => _register(email, password)}>
                        <Text style={styles.buttonText}>Register</Text>
                    </TouchableOpacity>
                    <TouchableOpacity style={styles.navButtonText}
                        onPress={() => navigation.navigate('SignUp')}
                        >
                        <Text style={styles.navButtonText}>Go to Login</Text>
                    </TouchableOpacity>
                </Animatable.View>
            </View>
        )
    }

export default SignIn;
const {width,height} = Dimensions.get("screen");
const height_logo = height * 0.7 * 0.4;
var styles =StyleSheet.create({
    input: {
        padding: 10,
        marginBottom: 20,
        width: width / 1.5,
        height: height / 15,
        fontSize: 16,
        borderRadius: 8,
        borderWidth: 1

    },
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
        justifyContent:'flex-start',
        alignItems:'center',
        backgroundColor:'white',
        borderTopLeftRadius:30,
        borderTopRightRadius:30,
        paddingVertical:50,
        paddingHorizontal:30,
        paddingBottom:100
    },
    text:{
        color:'#ffff',
        fontSize: 35,
        justifyContent:'center',
        alignItems:'center',
        marginBottom: 20,
        fontWeight:'bold'
    },
   
    buttonText: {
        fontSize: 28,
        color: '#ffffff'
    },
    navButtonText: {
        fontSize: 20,
        color: '#6646ee'
    },
    buttonContainer :{
        width:150,
        height:40,
        backgroundColor:'#6495ed',
        alignItems:'center',
        justifyContent:'center',
        borderRadius:50,
        flexDirection:'row',
        marginTop:10

    },
    buttonText:{
        color:'#ffff',
        fontWeight:'bold'
    }
})