//Import necessary packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///*************************COLORS**************************/
const MainColor = Color(0xFF1a1a2e);
const SubMainColor = Color(0xFF0f3460);
const MainFontsColor = Color(0xFFe94560);
const SubFontsColor = Color(0xFFffffff);

///*******************SEATS COLORS*****************************/
const BookedSeatColor = Color(0xFFf41606);
const AvailableSeatColor = Color(0xFF4da602);
const FreeSeatColor = Color(0xFFffffff);
const YourReservedSeatsColor = Color(0xFF868981);

///*************************App Bar Text Style**************************/
const AppBarFontStyle = TextStyle(
  fontSize: 23.0,
  fontWeight: FontWeight.w700,
  fontStyle: FontStyle.italic,
  color: SubFontsColor,
);

const AppBarLabeledBottomFontStyle = TextStyle(
    fontSize: 17.0, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic);

const AppBarUnLabeledBottomFontStyle = TextStyle(
  fontSize: 16.0,
);

///*************************Movies Label Text Style**************************/
const MoviesLabelFontStyle = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.normal,
  color: SubFontsColor,
);

///*************************Hint Label Text Style**************************/
const HintLabelFontStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w800,
  fontStyle: FontStyle.italic,
  color: MainFontsColor,
);

// MOVIECARD
const MoviesCardDecoration = BoxDecoration(color: MainColor, boxShadow: [
  BoxShadow(
    blurRadius: 2.5,
    spreadRadius: 1.0,
    offset: Offset(
      0,
      2.0,
    ),
  )
]);

const IconData film = const IconData(63083,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage);

const IconData noti = const IconData(62859,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage);
