import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:customer_app/Components/Constants.dart';
import 'package:customer_app/Components/Size_Configurations.dart';
import 'package:customer_app/Components/Navigator.dart';
import 'package:customer_app/Components/FlushBar.dart';
import 'package:customer_app/Models/Movies_Model.dart';
import 'package:customer_app/Screens/Sign_In_Screen.dart';
import 'package:customer_app/Screens/Notifications_Screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      child: Scaffold(
        backgroundColor: MainColor,
        appBar: AppBar(
          toolbarHeight: 100,
          title: Text(
            'Movies Tickets App',
            style: AppBarFontStyle,
          ),
          backgroundColor: MainColor,
          elevation: 4.0,
          actions: [
            IconButton(
              icon: Icon(
                noti,
                color: MainFontsColor,
                size: 45,
              ),
              onPressed: () {
                CustomRouter().navigator(context, NotificationsScreen());
              },
              iconSize: 35,
            ),
            IconButton(
              icon: Icon(
                Icons.logout,
                color: MainFontsColor,
              ),
              onPressed: logOut,
              iconSize: 35,
            ),
          ],
          leading: Row(
            children: [
              SizedBox(width: 18),
              Icon(film, color: MainFontsColor, size: 35),
            ],
          ),
        ),
        //////////////////////////l7ad hna l app bar///////////////////////////


        body: SingleChildScrollView(
        // physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 50), //// l kalam eli 2abl l ekhtyar
              Text(
                ' Book your favourite movie ',
                textAlign: TextAlign.left,
                style:TextStyle(
                  
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                  fontSize: 27
                ),
              ),
              SizedBox(height:10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Features',
                      textAlign: TextAlign.center,
                      style:TextStyle(
                        color: SubFontsColor,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.normal,
                        fontSize: 17
                      ),
                    ),
                     Text(
                      ' Movies',
                      textAlign: TextAlign.center,
                      style:TextStyle(
                        color: SubFontsColor,
                        fontWeight: FontWeight.w200,
                        fontStyle: FontStyle.normal,
                        fontSize: 17
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 50),
             
              SizedBox(
                height: 820,
                
                child: ListView(
                  shrinkWrap: true,
                  //primary:true
                   //physics: ScrollPhysics(),
                 scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      //margin: EdgeInsets.only(top: SizeConfig.defaultSize),
                      //height: SizeConfig.defaultSize * 92,
                      width: SizeConfig.defaultSize * 60,
                      child: MoviesStream(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onWillPop: _onWillPop,
    );
  }

  // ignore: missing_return
  Future<bool> _onWillPop() {
    SystemNavigator.pop();
  }

  final _auth = FirebaseAuth.instance;

  void logOut() async {
    //Check if there is internet connection or not and display message error if not.
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Warning().errorMessage(context,
          title: "No internet connection !",
          message: "Pleas turn on wifi or mobile data",
          icons: Icons.signal_wifi_off);
    } else {
      _auth.signOut();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('EMAIL');
      CustomRouter().navigator(context, SignIn());
    }
  }
}
