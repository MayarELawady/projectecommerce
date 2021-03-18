import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:customer_app/Components/Seats.dart';
import 'package:customer_app/Components/Constants.dart';
import 'package:customer_app/Components/Size_Configurations.dart';
import 'package:customer_app/Components/Navigator.dart';
import 'package:customer_app/Components/FlushBar.dart';
import 'package:customer_app/Screens/Home_Screen.dart';

class BookSeat extends StatefulWidget {
  BookSeat({this.movieDocID});
  final String movieDocID;
  @override
  _BookSeatState createState() => _BookSeatState();
}

class _BookSeatState extends State<BookSeat> {
  final fireStore = FirebaseFirestore.instance;
  var list = [];

  void getData() async {
    final doc =
        await fireStore.collection('Movies').doc(widget.movieDocID).get();
    var tempSeats = doc['Seats'];
    setState(() {
      list = tempSeats;
    });
    for (int j = 0; j < seats.length; j++) {
      setState(() {
        seats[j]["id"] = list[j]["ID"];
        seats[j]["isReserved"] = list[j]["Is Reserved"];
        seats[j]["user"] = list[j]["User"];
      });
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  var seats = [
    {"id": 1, "isReserved": false, "user": ""},
    {"id": 2, "isReserved": false, "user": ""},
    {"id": 3, "isReserved": false, "user": ""},
    {"id": 4, "isReserved": false, "user": ""},
    {"id": 5, "isReserved": false, "user": ""},
    {"id": 6, "isReserved": false, "user": ""},
    {"id": 7, "isReserved": false, "user": ""},
    {"id": 8, "isReserved": false, "user": ""},
    {"id": 9, "isReserved": false, "user": ""},
    {"id": 10, "isReserved": false, "user": ""},
    {"id": 11, "isReserved": false, "user": ""},
    {"id": 12, "isReserved": false, "user": ""},
    {"id": 13, "isReserved": false, "user": ""},
    {"id": 14, "isReserved": false, "user": ""},
    {"id": 15, "isReserved": false, "user": ""},
    {"id": 16, "isReserved": false, "user": ""},
    {"id": 17, "isReserved": false, "user": ""},
    {"id": 18, "isReserved": false, "user": ""},
    {"id": 19, "isReserved": false, "user": ""},
    {"id": 20, "isReserved": false, "user": ""},
    {"id": 21, "isReserved": false, "user": ""},
    {"id": 22, "isReserved": false, "user": ""},
    {"id": 23, "isReserved": false, "user": ""},
    {"id": 24, "isReserved": false, "user": ""},
    {"id": 25, "isReserved": false, "user": ""},
    {"id": 26, "isReserved": false, "user": ""},
    {"id": 27, "isReserved": false, "user": ""},
    {"id": 28, "isReserved": false, "user": ""},
    {"id": 29, "isReserved": false, "user": ""},
    {"id": 30, "isReserved": false, "user": ""},
    {"id": 31, "isReserved": false, "user": ""},
    {"id": 32, "isReserved": false, "user": ""},
    {"id": 33, "isReserved": false, "user": ""},
    {"id": 34, "isReserved": false, "user": ""},
    {"id": 35, "isReserved": false, "user": ""},
    {"id": 36, "isReserved": false, "user": ""},
    {"id": 37, "isReserved": false, "user": ""},
    {"id": 38, "isReserved": false, "user": ""},
    {"id": 39, "isReserved": false, "user": ""},
    {"id": 40, "isReserved": false, "user": ""},
    {"id": 41, "isReserved": false, "user": ""},
    {"id": 42, "isReserved": false, "user": ""},
    {"id": 43, "isReserved": false, "user": ""},
    {"id": 44, "isReserved": false, "user": ""},
    {"id": 45, "isReserved": false, "user": ""},
    {"id": 46, "isReserved": false, "user": ""},
    {"id": 47, "isReserved": false, "user": ""},
  ];

  @override
  Widget build(BuildContext context) {
    //Size Configurations to resize widgets according to screen size.
    SizeConfig().init(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: MainColor,
      body: Container(
        margin: EdgeInsets.only(top: SizeConfig.defaultSize * 10.0),
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.defaultSize - 5.0),
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  "Pick Your Seat",
                   style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 40,
                    color: SubFontsColor),
              ),
                ),
              
              SizedBox(height:65),

              // First Seat Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: SizeConfig.defaultSize,
                  ),

                  //Seat #1
                  Seat(
                    selectedSeatID: seats[0]["id"],
                    isReserved: seats[0]["isReserved"],
                    userEmail: seats[0]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #2
                  Seat(
                    selectedSeatID: seats[1]["id"],
                    isReserved: seats[1]["isReserved"],
                    userEmail: seats[1]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #3
                  Seat(
                    selectedSeatID: seats[2]["id"],
                    isReserved: seats[2]["isReserved"],
                    userEmail: seats[2]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #4
                  Seat(
                    selectedSeatID: seats[3]["id"],
                    isReserved: seats[3]["isReserved"],
                    userEmail: seats[3]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  SizedBox(
                    width: SizeConfig.defaultSize,
                  ),

                  //Seat #5
                  Seat(
                    selectedSeatID: seats[4]["id"],
                    isReserved: seats[4]["isReserved"],
                    userEmail: seats[4]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #6
                  Seat(
                    selectedSeatID: seats[5]["id"],
                    isReserved: seats[5]["isReserved"],
                    userEmail: seats[5]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #7
                  Seat(
                    selectedSeatID: seats[6]["id"],
                    isReserved: seats[6]["isReserved"],
                    userEmail: seats[6]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  SizedBox(
                    width: SizeConfig.defaultSize,
                  ),
                ],
              ),

              // Second Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Seat #8
                  Seat(
                    selectedSeatID: seats[7]["id"],
                    isReserved: seats[7]["isReserved"],
                    userEmail: seats[7]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #9
                  Seat(
                    selectedSeatID: seats[8]["id"],
                    isReserved: seats[8]["isReserved"],
                    userEmail: seats[8]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #10
                  Seat(
                    selectedSeatID: seats[9]["id"],
                    isReserved: seats[9]["isReserved"],
                    userEmail: seats[9]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #11
                  Seat(
                    selectedSeatID: seats[10]["id"],
                    isReserved: seats[10]["isReserved"],
                    userEmail: seats[10]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  SizedBox(
                    width: SizeConfig.defaultSize,
                  ),

                  //Seat #12
                  Seat(
                    selectedSeatID: seats[11]["id"],
                    isReserved: seats[11]["isReserved"],
                    userEmail: seats[11]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #13
                  Seat(
                    selectedSeatID: seats[12]["id"],
                    isReserved: seats[12]["isReserved"],
                    userEmail: seats[12]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #14
                  Seat(
                    selectedSeatID: seats[13]["id"],
                    isReserved: seats[13]["isReserved"],
                    userEmail: seats[13]["user"],
                    movieDOC: widget.movieDocID,
                  ),
                ],
              ),

              // Third  Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Seat #15
                  Seat(
                    selectedSeatID: seats[14]["id"],
                    isReserved: seats[14]["isReserved"],
                    userEmail: seats[14]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #16
                  Seat(
                    selectedSeatID: seats[15]["id"],
                    isReserved: seats[15]["isReserved"],
                    userEmail: seats[15]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #17
                  Seat(
                    selectedSeatID: seats[16]["id"],
                    isReserved: seats[16]["isReserved"],
                    userEmail: seats[16]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #18
                  Seat(
                    selectedSeatID: seats[17]["id"],
                    isReserved: seats[17]["isReserved"],
                    userEmail: seats[17]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  SizedBox(
                    width: SizeConfig.defaultSize,
                  ),

                  //Seat #19
                  Seat(
                    selectedSeatID: seats[18]["id"],
                    isReserved: seats[18]["isReserved"],
                    userEmail: seats[18]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #20
                  Seat(
                    selectedSeatID: seats[19]["id"],
                    isReserved: seats[19]["isReserved"],
                    userEmail: seats[19]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #21
                  Seat(
                    selectedSeatID: seats[20]["id"],
                    isReserved: seats[20]["isReserved"],
                    userEmail: seats[20]["user"],
                    movieDOC: widget.movieDocID,
                  ),
                ],
              ),

              // 4TH Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Seat #22
                  Seat(
                    selectedSeatID: seats[21]["id"],
                    isReserved: seats[21]["isReserved"],
                    userEmail: seats[21]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #23
                  Seat(
                    selectedSeatID: seats[22]["id"],
                    isReserved: seats[22]["isReserved"],
                    userEmail: seats[22]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #24
                  Seat(
                    selectedSeatID: seats[23]["id"],
                    isReserved: seats[23]["isReserved"],
                    userEmail: seats[23]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #25
                  Seat(
                    selectedSeatID: seats[24]["id"],
                    isReserved: seats[24]["isReserved"],
                    userEmail: seats[24]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  SizedBox(
                    width: SizeConfig.defaultSize,
                  ),

                  //Seat #26
                  Seat(
                    selectedSeatID: seats[25]["id"],
                    isReserved: seats[25]["isReserved"],
                    userEmail: seats[25]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #27
                  Seat(
                    selectedSeatID: seats[26]["id"],
                    isReserved: seats[26]["isReserved"],
                    userEmail: seats[26]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #28
                  Seat(
                    selectedSeatID: seats[27]["id"],
                    isReserved: seats[27]["isReserved"],
                    userEmail: seats[27]["user"],
                    movieDOC: widget.movieDocID,
                  ),
                ],
              ),

              // 5TH Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Seat #29
                  Seat(
                    selectedSeatID: seats[28]["id"],
                    isReserved: seats[28]["isReserved"],
                    userEmail: seats[28]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #30
                  Seat(
                    selectedSeatID: seats[29]["id"],
                    isReserved: seats[29]["isReserved"],
                    userEmail: seats[29]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #31
                  Seat(
                    selectedSeatID: seats[30]["id"],
                    isReserved: seats[30]["isReserved"],
                    userEmail: seats[30]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #32
                  Seat(
                    selectedSeatID: seats[31]["id"],
                    isReserved: seats[31]["isReserved"],
                    userEmail: seats[31]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  SizedBox(
                    width: SizeConfig.defaultSize,
                  ),

                  //Seat #33
                  Seat(
                    selectedSeatID: seats[32]["id"],
                    isReserved: seats[32]["isReserved"],
                    userEmail: seats[32]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #34
                  Seat(
                    selectedSeatID: seats[33]["id"],
                    isReserved: seats[33]["isReserved"],
                    userEmail: seats[33]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #35
                  Seat(
                    selectedSeatID: seats[34]["id"],
                    isReserved: seats[34]["isReserved"],
                    userEmail: seats[34]["user"],
                    movieDOC: widget.movieDocID,
                  ),
                ],
              ),

              // 6TH Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Seat #36
                  Seat(
                    selectedSeatID: seats[35]["id"],
                    isReserved: seats[35]["isReserved"],
                    userEmail: seats[35]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #37
                  Seat(
                    selectedSeatID: seats[36]["id"],
                    isReserved: seats[36]["isReserved"],
                    userEmail: seats[36]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #38
                  Seat(
                    selectedSeatID: seats[37]["id"],
                    isReserved: seats[37]["isReserved"],
                    userEmail: seats[37]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #39
                  Seat(
                    selectedSeatID: seats[38]["id"],
                    isReserved: seats[38]["isReserved"],
                    userEmail: seats[38]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  SizedBox(
                    width: SizeConfig.defaultSize,
                  ),

                  //Seat #40
                  Seat(
                    selectedSeatID: seats[39]["id"],
                    isReserved: seats[39]["isReserved"],
                    userEmail: seats[39]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #41
                  Seat(
                    selectedSeatID: seats[40]["id"],
                    isReserved: seats[40]["isReserved"],
                    userEmail: seats[40]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #42
                  Seat(
                    selectedSeatID: seats[41]["id"],
                    isReserved: seats[41]["isReserved"],
                    userEmail: seats[41]["user"],
                    movieDOC: widget.movieDocID,
                  ),
                ],
              ),

              // final Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: SizeConfig.defaultSize,
                  ),

                  //Seat #43
                  Seat(
                    selectedSeatID: seats[42]["id"],
                    isReserved: seats[42]["isReserved"],
                    userEmail: seats[42]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #44
                  Seat(
                    selectedSeatID: seats[43]["id"],
                    isReserved: seats[43]["isReserved"],
                    userEmail: seats[43]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #45
                  Seat(
                    selectedSeatID: seats[44]["id"],
                    isReserved: seats[44]["isReserved"],
                    userEmail: seats[44]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  SizedBox(
                    width: SizeConfig.defaultSize,
                  ),

                  //Seat #46
                  Seat(
                    selectedSeatID: seats[45]["id"],
                    isReserved: seats[45]["isReserved"],
                    userEmail: seats[45]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  //Seat #47
                  Seat(
                    selectedSeatID: seats[46]["id"],
                    isReserved: seats[46]["isReserved"],
                    userEmail: seats[46]["user"],
                    movieDOC: widget.movieDocID,
                  ),

                  SizedBox(
                    width: SizeConfig.defaultSize,
                  ),
                ],
              ),

              SizedBox(
                height: SizeConfig.defaultSize * 5.0,
              ),

              //Hints Row
              Row(
                children: [
                  //Available hint.
                  Container(
                    margin: EdgeInsets.only(
                      left: SizeConfig.defaultSize * 9.0,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 19.0,
                          height: 19.0,
                          decoration: BoxDecoration(
                            color: FreeSeatColor,
                            border: Border.all(
                              color: SubMainColor,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.defaultSize - 3.0,
                        ),
                        Container(
                          child: Text(
                            "Available",
                            style: HintLabelFontStyle,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: SizeConfig.defaultSize - 9.0,
                  ),

                  //Selected hint.
                  Container(
                    margin: EdgeInsets.only(
                      left: SizeConfig.defaultSize * 4.3,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 19.0,
                          height: 19.0,
                          decoration: BoxDecoration(
                            color: AvailableSeatColor,
                            border: Border.all(
                              color: Colors.white,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.defaultSize - 3.0,
                        ),
                        Container(
                          child: Text(
                            "Selected",
                            style: HintLabelFontStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: SizeConfig.defaultSize,
              ),

              Row(
                children: [
                  //Reserved hint
                  Container(
                    margin: EdgeInsets.only(
                      left: SizeConfig.defaultSize * 9.0,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 19.0,
                          height: 19.0,
                          decoration: BoxDecoration(
                            color: BookedSeatColor,
                            border: Border.all(
                              color: Colors.white,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.defaultSize - 3.0,
                        ),
                        Container(
                          child: Text(
                            "Reserved",
                            style: HintLabelFontStyle,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: SizeConfig.defaultSize - 9.0,
                  ),

                  //Your Seats hint
                  Container(
                    margin: EdgeInsets.only(
                      left: SizeConfig.defaultSize * 4.0,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 19.0,
                          height: 19.0,
                          decoration: BoxDecoration(
                            color: YourReservedSeatsColor,
                            border: Border.all(
                              color: Colors.white,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.defaultSize - 3.0,
                        ),
                        Container(
                          child: Text(
                            "Your Seats",
                            style: HintLabelFontStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: submitBook,
        backgroundColor: MainFontsColor,
        
        label: Text(
          "Submit",
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w700,
            color: SubFontsColor,
          ),
        ),
      ),
    );
  }

  List<dynamic> ids = [];
  List<dynamic> newSelectedIDs = [];
  int numberOfSeats;
  int numberOfSeatsForNotification;
  var seatsData = [];

  void submitBook() async {
    //Check if there is internet connection or not and display message error if not.
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Warning().errorMessage(
        context,
        title: "No internet connection !",
        message: "Pleas turn on wifi or mobile data",
        icons: Icons.signal_wifi_off,
      );
    } else {
      try {
        final doc =
            await fireStore.collection('Movies').doc(widget.movieDocID).get();
        List<dynamic> tempids = doc['Selected IDs'];
        var tempSeatsData = doc['Seats'];
        var tempNumberOfSeats = doc['Number of seats'];
        setState(() {
          ids = tempids;
          seatsData = tempSeatsData;
          numberOfSeats = tempNumberOfSeats;
        });
        setState(() {
          numberOfSeatsForNotification = ids.length;
        });
        if (ids.isEmpty) {
          showDialog(
              context: context,
              child: AlertDialog(
                backgroundColor: SubFontsColor,
                elevation: 1.0,
                content: Text(
                  "Please Choose your Seat !",
                  style: TextStyle(
                    color: MainColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 20.0,
                  ),
                ),
                actions: [
                  ButtonTheme(
                    child: RaisedButton(
                      color: MainColor,
                      child: Text(
                        'Ok',
                        style: TextStyle(
                          color: SubFontsColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ));
        } else {
          // Warning().errorMessage(
          //   context,
          //   title: "Booking....",
          //   message: "Booking your seats is on progress",
          //   icons: Icons.arrow_circle_up,
          // );
          SharedPreferences getpref = await SharedPreferences.getInstance();
          var user = getpref.getString('EMAIL');
          for (int i = 0; i < ids.length; i++) {
            for (int j = 0; j < seatsData.length; j++) {
              if (ids[i] == seatsData[j]["ID"]) {
                setState(() {
                  seatsData[j]["Is Reserved"] = true;
                  seatsData[j]["User"] = user;
                });
              }
            }
          }
          await fireStore.collection('Movies').doc(widget.movieDocID).update({
            'Seats': seatsData,
            'Number of seats': numberOfSeats - ids.length,
          });
          createUserNotifications();
          showDialog(
              context: context,
              child: AlertDialog(
                backgroundColor: SubFontsColor,
                elevation: 1.0,
                content: Text(
                  "${ids.length} seat booked successfully !",
                  style: TextStyle(
                    color: MainColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 20.0,
                  ),
                ),
                actions: [
                  ButtonTheme(
                    child: RaisedButton(
                      color: MainFontsColor,
                      child: Text(
                        'Ok',
                        style: TextStyle(
                          color:SubFontsColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {
                        CustomRouter().navigator(context, Home());
                      },
                    ),
                  ),
                ],
              ));
          ids.clear();
          setState(() {
            newSelectedIDs = ids;
          });
          await fireStore.collection('Movies').doc(widget.movieDocID).update({
            'Selected IDs': newSelectedIDs,
            'Selected IDs Index': -1,
          });
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }

  String userName;
  String userImage;

  void createUserNotifications() async {
    SharedPreferences getpref = await SharedPreferences.getInstance();
    var userDocID = getpref.getString('EMAIL');
    try {
      final userDoc = await fireStore.collection('Users').doc(userDocID).get();
      var name = userDoc['User Name'];
      var image = userDoc['Image'];

      setState(() {
        userName = name;
        userImage = image;
      });

      await fireStore.collection('Customer Notifications').doc().set({
        'User Name': userName,
        'User Image': userImage,
        'Number Of Booked Seats': numberOfSeatsForNotification,
        'Movie DocID': widget.movieDocID,
        'Time Stamp': DateTime.now(),
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
