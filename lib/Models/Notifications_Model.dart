import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer_app/Components/Constants.dart';
import 'package:customer_app/Components/Navigator.dart';
import 'package:customer_app/Components/Size_Configurations.dart';
import 'package:customer_app/Screens/Movie_Details_Screen.dart';

final _firestore = FirebaseFirestore.instance;

class NotificationsStream extends StatefulWidget {
  @override
  _NotificationsStreamState createState() => _NotificationsStreamState();
}

class _NotificationsStreamState extends State<NotificationsStream> {
  @override
  Widget build(BuildContext context) {
    //Size Configurations to resize widgets according to screen size.
    SizeConfig().init(context);
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('Vendor Notifications')
          .orderBy(
            "Time Stamp",
            descending: true,
          )
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: SubMainColor,
            ),
          );
        }
        final notifications = snapshot.data.docs;
        List<SingleNotifications> notificationsList = [];
        for (var item in notifications) {
          final movieDocID = item.data()['Movie DOC ID'];

          final notificationsTile = SingleNotifications(
            movieDocID: movieDocID,
          );

          notificationsList.add(notificationsTile);
        }

        return ListView.builder(
          itemCount: notificationsList.length,
          itemBuilder: (context, i) => Column(children: <Widget>[
            notificationsList[i],
            Divider(
              color: SubMainColor,
              indent: 80.0,
              endIndent: 30.0,
              thickness: 0.8,
            ),
          ]),
        );
      },
    );
  }
}

class SingleNotifications extends StatelessWidget {
  SingleNotifications({
    this.movieDocID,
  });
  final String movieDocID;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Vendor added new movie !",
        style: TextStyle(
          fontFamily: 'Futura PT',
          fontSize: 22,
          color: MainFontsColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: () {
        CustomRouter().navigator(
            context,
            MovieDetails(
              documentID: movieDocID,
            ));
      },
    );
  }
}
