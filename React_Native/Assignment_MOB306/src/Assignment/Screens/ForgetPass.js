import React,{ useState } from "react";
import{
    View,
    Text,
    StyleSheet,
    StatusBar,
    TextInput,
    Dimensions,
    ToastAndroid,
    TouchableOpacity
} from "react-native";
import * as Animatable from 'react-native-animatable'
import { firebaseConfig } from '../Firebase/Firebase';

const SignUp=({navigation})=>{
    const [email, setEmail] = useState('');
    const sendResetPasswordEmail = async(email) => {
        await firebaseConfig.auth().sendPasswordResetEmail(email).then(function (user){
          ToastAndroid.show('Pleas check your email...', ToastAndroid.SHORT); 
          navigation.navigate('SignUp');
        }).catch(function (e) {
          console.log(e)
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
                        <Text style={styles.text}>Forget Password Screen</Text>
                    </Animatable.Text>
                </View>
                <Animatable.View 
                style={styles.footer}
                animation="fadeInUpBig">
                    <TextInput style={styles.input} 
                        value ={email} 
                        placeholder="Email" 
                        onChangeText={(text)=>setEmail(text)}/>
                    <TouchableOpacity style={styles.buttonContainer} 
                        onPress={()=> sendResetPasswordEmail(email)}>
                        <Text style={styles.buttonText}>Send</Text>
                    </TouchableOpacity>
                    <TouchableOpacity style={styles.navButtonText}
                        onPress={() => navigation.navigate('SignUp')}>
                        <Text style={styles.navButtonText}>Go back SignUp</Text>
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