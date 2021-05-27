import React,{ useState } from "react";
import{
    View,
    Text,
    StyleSheet,
    StatusBar,
    TextInput,
    Dimensions,
    TouchableOpacity
} from "react-native";
import * as Animatable from 'react-native-animatable'

//socket
import socketIOClient from "socket.io-client";
const ENDPOINT = "http://172.20.10.2:3000";
const socket = socketIOClient(ENDPOINT);

const SignUp=({navigation})=>{
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    //put value socket from sv
    const onLoginPressed = async(email, password) => {
        await 
        socket.emit("login", email,password);
        
        //
        await 

        socket.on('login', (result) => {
            if(result == true){
                navigation.navigate('About');
            }
        })

    }
        return(
            <View style={styles.container}>
                <StatusBar barStyle="Light-content"/>
                <View style={styles.header}>
                    <Animatable.Text
                    animation="bounceIn"
                    duration={1500}
                    style={styles.logo}
                    resizeMode={"stretch"}
                    >
                        <Text style={styles.text}>Login Screen</Text>
                    </Animatable.Text>
                </View>
                <Animatable.View 
                style={styles.footer}
                animation="fadeInUpBig">
                    <TextInput style={styles.input} 
                        value ={email} 
                        placeholder="Email" 
                        onChangeText={(text)=>setEmail(text)}/>
                    <TextInput style={styles.input} 
                        value ={password} 
                        placeholder="Password" 
                        onChangeText={(text)=>setPassword(text)}
                        secureTextEntry={true}/>

                    <TouchableOpacity style={styles.buttonContainer} 
                        onPress={()=> onLoginPressed(email, password)}>
                        <Text style={styles.buttonText}>Login</Text>
                    </TouchableOpacity>


                    <TouchableOpacity style={styles.navButtonText}
                        onPress={() => navigation.navigate('SignIn')}>
                        <Text style={styles.navButtonText}>New user? Join here</Text>
                    </TouchableOpacity>
                    <TouchableOpacity style={styles.navButtonText}
                        onPress={() => navigation.navigate('ForgetPass')}>
                        <Text style={styles.navButtonText}>Forget password?</Text>
                    </TouchableOpacity>
                </Animatable.View>
            </View>
        )
    }

export default SignUp;
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