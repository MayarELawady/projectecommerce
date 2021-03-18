import 'package:customer_app/Screens/Sign_In_Screen.dart';
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
//import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:customer_app/Components/Constants.dart';
//import 'package:customer_app/Components/Custom_Text_Field.dart';
import 'package:customer_app/Components/Size_Configurations.dart';
import 'package:customer_app/Components/Navigator.dart';
import 'package:customer_app/Components/FlushBar.dart';
//import 'package:customer_app/Screens/Image_Selection.dart';
import 'package:customer_app/Screens/Home_Screen.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //variable '_image' to hold selected image.
  //File _image;
  final fireStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    //Size Configurations to resize widgets according to screen size.
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: MainColor,
      body: Container(
        margin: EdgeInsets.only(
          top: SizeConfig.defaultSize * 10.0,
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                bottom: SizeConfig.defaultSize * 2.0,
              ),
              child: Text(
                "Sign Up",
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
                  labelText: 'User name',
                  labelStyle: TextStyle(color: Colors.grey[400]),
                ),
                controller: userNameController,
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
            SizedBox(height: 35),
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
            ),
            SizedBox(height: 35),
            ///guz2 l sora//
            // Container(
            //   margin: EdgeInsets.only(
            //     top: SizeConfig.defaultSize * 2,
            //     left: SizeConfig.defaultSize,
            //   ),
            //   height: SizeConfig.defaultSize * 4,
              // child: Row(
              //   children: [
              //     Text(
              //       'Image :',
              //       style: TextStyle(
              //         fontSize: 22.0,
              //         fontWeight: FontWeight.w700,
              //         color: MainFontsColor,
              //       ),
              //     ),
              //     SizedBox(
              //       width: SizeConfig.defaultSize,
              //     ),
              //     ButtonTheme(
              //       minWidth: SizeConfig.defaultSize * 12,
              //       height: SizeConfig.defaultSize * 3,
              //       child: RaisedButton(
              //         color: SubMainColor,
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(40),
              //         ),
              //         child: Text(
              //           'Choose file',
              //           style: TextStyle(
              //             fontSize: 18.0,
              //             color: Colors.blueGrey[900],
              //             fontWeight: FontWeight.w500,
              //           ),
              //         ),
              //         onPressed: chooseFile,
              //       ),
              //     ),
              //     SizedBox(
              //       width: SizeConfig.defaultSize,
              //     ),
              //     ButtonTheme(
              //       minWidth: SizeConfig.defaultSize * 12,
              //       height: SizeConfig.defaultSize * 3,
              //       child: RaisedButton(
              //         color: SubMainColor,
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(40),
              //         ),
              //         child: Text(
              //           'Take picture',
              //           style: TextStyle(
              //             fontSize: 18.0,
              //             color: Colors.blueGrey[900],
              //             fontWeight: FontWeight.w500,
              //           ),
              //         ),
              //         onPressed: takePicture,
              //       ),
              //     ),
              //   ],
              // ),
            //),
          //],
       // ),
      //),
      Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 50, right:50, bottom: 20),
            child: FloatingActionButton.extended(
              onPressed: signUp,
              label: Text(
                "         Sign Up         ",
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
          child: Text("Already a member?"),
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => SignIn()),);
          },)
        ],
      ),
            ), ],
        ),
        
      ),
     

      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: signUp,
      //   label: Text(
      //     "Sign Up",
      //     style: TextStyle(
      //       fontSize: 17.0,
      //       fontWeight: FontWeight.w500,
      //       color: Colors.blueGrey[900],
      //     ),
      //   ),
      //   backgroundColor: SubMainColor,
      //   icon: Icon(
      //     Icons.person_add,
      //     color: Colors.blueGrey[900],
      //     size: 30.0,
      //   ),
      // ),
    );
  }

  ///*****************************BACK END****************************************/
  //Text Editing Controllers to get data from Text Fields.
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;

  void titleDispose() {
    emailController.dispose();
    super.dispose();
  }

  void descriptionDispose() {
    userNameController.dispose();
    super.dispose();
  }

  void timeDispose() {
    passwordController.dispose();
    super.dispose();
  }

  // //Method 'chooseFile' to make the user choose photo from device's gallary.
  // Future chooseFile() async {
  //   final _picker = ImagePicker();
  //   PickedFile image = await _picker.getImage(source: ImageSource.gallery);
  //   setState(() {
  //     _image = File(image.path);
  //   });
  //   CustomRouter().navigator(
  //     context,
  //     Selection(
  //       picture: _image,
  //     ),
  //   );
  // }

  // //Method 'takePicture' to make the user choose photo from device's gallary.
  // Future takePicture() async {
  //   final _picker = ImagePicker();
  //   PickedFile image = await _picker.getImage(source: ImageSource.camera);
  //   setState(() {
  //     _image = File(image.path);
  //   });
  //   CustomRouter().navigator(
  //     context,
  //     Selection(
  //       picture: _image,
  //     ),
  //   );
  // }

  Future signUp() async {
    //Check if there is internet connection or not and display message error if not.
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Warning().errorMessage(
        context,
        title: "No internet connection !",
        message: "Pleas turn on wifi or mobile data",
        icons: Icons.signal_wifi_off,
      );

      //Ensure that 'Movie Title' field isn't empty.
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
        title: 'Invalid email !',
        message: "Email must contain '@' ",
        icons: Icons.warning,
      );
      emailController.clear();
      passwordController.clear();
      userNameController.clear();

      //Validate 'email' text field to make sure it contains '.com'.
    } else if (!emailController.text.contains('.com')) {
      Warning().errorMessage(
        context,
        title: 'Invalid email !',
        message: "Email must contain '.com' ",
        icons: Icons.warning,
      );
      emailController.clear();
      passwordController.clear();
      userNameController.clear();

      //Validate 'password' text field to make sure it's not empty.
    } else if (passwordController.text.isEmpty) {
      Warning().errorMessage(
        context,
        title: "Password field can't be empty !",
        message: "Please enter your password",
        icons: Icons.warning,
      );
      emailController.clear();

      
    } else if (passwordController.text.length < 6) {
      Warning().errorMessage(
        context,
        title: "Weak Passwrod !",
        message: "Password must be longer 6 character",
        icons: Icons.warning,
      );
      emailController.clear();
      passwordController.clear();
      userNameController.clear();

      
    } else {
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var uploadedImageUrl = prefs.getString('IMAGEURL');

        final newUser = await auth.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        prefs.setString('EMAIL', emailController.text);
        await fireStore
            .collection('Users')
            .doc(emailController.text.replaceAll(new RegExp(r"\s+\b|\b\s"), ""))
            .set({
          'Email': emailController.text,
          'User Name': userNameController.text,
          'Image': uploadedImageUrl,
        });
        if (newUser != null) {
          CustomRouter().navigator(context, Home());
        }
      } catch (e) {
      
        Warning().errorMessage(
          context,
          title: "Can't Sign Up !",
          message: "Try Again",
          icons: Icons.warning,
        );
        emailController.clear();
        passwordController.clear();
        userNameController.clear();
      }
    }
  }
}
