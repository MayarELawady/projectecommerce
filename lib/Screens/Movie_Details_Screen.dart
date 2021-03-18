import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer_app/Components/Size_Configurations.dart';
import 'package:customer_app/Components/Constants.dart';
import 'package:customer_app/Components/Navigator.dart';
import 'package:customer_app/Screens/Sign_Up_Screen.dart';
import 'package:customer_app/Screens/Sign_In_Screen.dart';
import 'package:customer_app/Screens/Book_Seats_Screen.dart';

class MovieDetails extends StatefulWidget {
  MovieDetails({
    this.documentID,
  });

  final String documentID;

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  String title = '';
  String description = '';
  String time = '';
  String image =
      "https://firebasestorage.googleapis.com/v0/b/cinema-management-system-39a82.appspot.com/o/images.png?alt=media&token=23d14fd0-c816-49e8-8776-59cc4bca30f1";
  int seats = 0;

  final fireStore = FirebaseFirestore.instance;
  void getData() async {
    final doc =
        await fireStore.collection('Movies').doc(widget.documentID).get();
    var movieTitle = doc['Title'];
    var movieDescription = doc['Description'];
    var movieTime = doc['Time'];
    var movieImage = doc['Image'];
    var movieSeats = doc['Number of seats'];

    setState(() {
      title = movieTitle;
      description = movieDescription;
      time = movieTime;
      image = movieImage;
      seats = movieSeats;
    });
  }

  @override
  void initState() {
    getData();
    Future.delayed(Duration(seconds: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Size Configurations to resize widgets according to screen size.
   SizeConfig().init(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: MainColor,
      body: ListView (
        primary: true,
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
       shrinkWrap: true,
          children:[ Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Card(
          color: SubMainColor,
          margin: EdgeInsets.only(top: 20, left: 10),
          shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100.0)),
          elevation: 20.0,
          child: Container(
            width: 300,
            height: 400,
            decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(60.0),
      color: SubMainColor,
            ),
            child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Image.network(
              image,
              fit: BoxFit.cover,
              width: 350,
              height: 400,
            ),
          ),
        ),
      ],
            ),
          ),
        ),
        Container(
          width: 300,
          margin: EdgeInsets.only(
            top: SizeConfig.defaultSize * 3.0,
            left: 10,
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
      'Time :'.toUpperCase(),
      style: TextStyle(
        color: Colors.grey[500],
        fontSize: 15.0,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.italic,
      ),
            ),
            SizedBox(
      width: SizeConfig.defaultSize,
            ),
            Text(
      time,
      style: TextStyle(
        color: Colors.grey[500],
        fontSize: 15.0,
        fontWeight: FontWeight.w300,
      ),
            ),
            SizedBox(
      width: 30,
            ),
            Row(
      children: [
        Text(
          ' |     Seats :'.toUpperCase(),
          style: TextStyle(
            color: Colors.grey[500],
            fontSize: 15.0,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.italic,
          ),
        ),
        SizedBox(
          width: SizeConfig.defaultSize,
        ),
        Text(
          seats.toString(),
          style: TextStyle(
            color: Colors.grey[500],
            fontSize: 15.0,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
            ),
          ]),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
      Icons.star,
      color: Colors.grey,
      size: 19.0,
            ),
            Icon(
      Icons.star,
      color: Colors.grey,
      size: 19.0,
      
            ),
            Icon(
      Icons.star_half,
      color: Colors.grey,
      size: 19.0,
     
            ),
            Icon(
      Icons.star_outline_outlined,
      color: Colors.grey,
      size: 19.0,
            ),
            Icon(
      Icons.star_outline_outlined,
      color: Colors.grey,
      size: 19.0,
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          //alignment: Alignment.center,
          margin: EdgeInsets.only(
         //   top: SizeConfig.defaultSize,
           // right: SizeConfig.defaultSize * 18.0,
          ),
          child: Text(
            title,
            style: TextStyle(
      color: MainFontsColor,
      fontSize: 25.0,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.italic,
            ),
          ),
        ),
        Row(
          children: [
             SizedBox(
          width: 30,
        ),  ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Opacity( opacity: 0.4,
                    child: RaisedButton(
          child: Text('Drama'),
          textColor: Colors.white,
          color: Colors.grey[600],
          onPressed: () {},
        ),
      ),
            ),
             SizedBox(
          width: 20,
        ),  ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Opacity( opacity: 0.4,
                child: RaisedButton(
      child: Text('Fantasy'),
      textColor: Colors.white,
      color: Colors.grey[600],
      onPressed: () {},
            ),
          ),
        ),
          ],
        ),
         
        SizedBox(
          height: 20,
        ),
        Container(
          width: 300,
          height: 200,
          child: Text(
            description,
            style: TextStyle(
      color: Colors.grey[500],
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(
          height: 20,
        ),SizedBox(
          height: 20,
        ),
      
             ], ),
     ], ),
        
        floatingActionButton: FloatingActionButton.extended(
            onPressed: bookSeat,
            backgroundColor: MainFontsColor,
            label: Text(
      "        Book your seat now!        ",
      style: AppBarLabeledBottomFontStyle,
            ),
          ),
   );
  }

  void bookSeat() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('EMAIL');
    email == null
        ? showDialog(
            context: context,
            child: AlertDialog(
              backgroundColor: Colors.blueGrey[900],
              elevation: 1.0,
              content: Text(
                'Sign in or Sign up to book movie seats',
                style: TextStyle(
                  color: MainFontsColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
              actions: [
                ButtonTheme(
                  child: RaisedButton(
                    color: SubMainColor,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.blueGrey[900],
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      CustomRouter().navigator(context, SignUp());
                    },
                  ),
                ),
                ButtonTheme(
                  child: RaisedButton(
                    color: SubMainColor,
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.blueGrey[900],
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      CustomRouter().navigator(context, SignIn());
                    },
                  ),
                ),
              ],
            ))
        : CustomRouter().navigator(
            context,
            BookSeat(
              movieDocID: widget.documentID,
            ));
  }
}
