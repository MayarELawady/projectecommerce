import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:customer_app/Components/Constants.dart';
//import 'package:customer_app/Components/Custom_Text_Field.dart';
import 'package:customer_app/Components/Size_Configurations.dart';
import 'package:customer_app/Components/Navigator.dart';
import 'package:customer_app/Components/FlushBar.dart';
import 'package:customer_app/Screens/Home_Screen.dart';
import 'Sign_Up_Screen.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final fireStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    //Size Configurations to resize widgets according to screen size.
    SizeConfig().init(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      resizeToAvoidBottomPadding: false,
      backgroundColor: MainColor,
      body: Container(
        margin: EdgeInsets.only(
          top: SizeConfig.defaultSize * 20.0,
          left: SizeConfig.defaultSize,
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                bottom: SizeConfig.defaultSize * 2.0,
              ),
              child: Text(
                "Sign In",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 40,
                    color: SubFontsColor),
              ),
            ),
            SizedBox(height: 35),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 30, top: 5),
              child: TextFormField(
                cursorColor: MainFontsColor,
                style: TextStyle(
                  color: SubFontsColor,
                  decorationColor: SubFontsColor,
                ),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MainFontsColor,
                    ),
                  ),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.grey[400]),
                ),
                controller: emailController,
              ),
            ),
            SizedBox(height: 60),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 30, top: 5),
              child: TextFormField(
                style: TextStyle(
                  color: SubFontsColor,
                  decorationColor: SubFontsColor,
                ),
                cursorColor: MainFontsColor,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MainFontsColor,
                    ),
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.grey[400]),
                ),
                controller: passwordController,
              ),
            ), Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 50, right:50, bottom: 20),
            child: FloatingActionButton.extended(
              onPressed: signIn,
              label: Text(
                "         Sign In         ",
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500,
                  color: SubFontsColor,
                ),
              ),
              backgroundColor: MainFontsColor,
            ),
          ),
           ElevatedButton(
             
             style: ElevatedButton.styleFrom(primary: SubFontsColor,onPrimary: MainFontsColor, shape: new RoundedRectangleBorder(
               borderRadius: new BorderRadius.circular(30.0),
               ),),
          child: Text("Don't Have an account yet?"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUp()),);
          },)
        ],
      ),
            ), ],
        ),
        
      ),
     
    );
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;

  void titleDispose() {
    emailController.dispose();
    super.dispose();
  }

  void timeDispose() {
    passwordController.dispose();
    super.dispose();
  }

  Future signIn() async {
   
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Warning().errorMessage(
        context,
        title: "No internet connection !",
        message: "Pleas turn on wifi or mobile data",
        icons: Icons.signal_wifi_off,
      );

      
    } else if (emailController.text.isEmpty) {
      Warning().errorMessage(
        context,
        title: "Email field can't be empty !",
        message: 'Please enter your email.',
        icons: Icons.warning,
      );

      //Validate 'email' text field to make sure it contains '@'.
    } else if (!emailController.text.contains('@')) {
      Warning().errorMessage(
        context,
        title: 'Invalid !',
        message: "Email must contain '@' ",
        icons: Icons.warning,
      );
      emailController.clear();
      passwordController.clear();

      
    } else if (!emailController.text.contains('.com')) {
      Warning().errorMessage(
        context,
        title: 'Invalid email !',
        message: "Email must contain '.com' ",
        icons: Icons.warning,
      );
      emailController.clear();
      passwordController.clear();

      
    } else if (passwordController.text.isEmpty) {
      Warning().errorMessage(
        context,
        title: "Password field can't be empty !",
        message: "Please enter your password",
        icons: Icons.warning,
      );
      emailController.clear();

      //Validate 'password' text field to make sure it's more than 6 characters in length.
    } else if (passwordController.text.length < 6) {
      Warning().errorMessage(
        context,
        title: "Invalid password length !",
        message: "Please try again",
        icons: Icons.warning,
      );
      emailController.clear();
      passwordController.clear();

     
    } else {
      try {
        final newUser = await auth.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('EMAIL', emailController.text);
        if (newUser != null) {
          CustomRouter().navigator(context, Home());
        }
      } catch (e) {
       
        Warning().errorMessage(
          context,
          title: "Can't Sign In !",
          message: "Check your Email and Password.",
          icons: Icons.warning,
        );
        emailController.clear();
        passwordController.clear();
      }
    }
  }
}
