import 'package:flutter/material.dart';

TextStyle textStyle = const TextStyle(
  color: const Color(0XFFFFFFFF),
  fontSize: 16.0,
  fontWeight: FontWeight.normal,
);

MaterialColor baseColor = Colors.red;
Color colorInDark = baseColor[100];
Color colorInLight = baseColor[900];
Color logoColor = Colors.yellow;

ThemeData appTheme = new ThemeData(
  primarySwatch: baseColor,
  primaryColor: baseColor[500],
  accentColor: Colors.yellow[900],
  secondaryHeaderColor: baseColor[900],
//  fontFamily: 'Nunito',
//   brightness: Brightness.dark,
  hintColor: Colors.white,
);

Color textFieldColor = const Color.fromRGBO(255, 255, 255, 0.1);

TextStyle makerTextStyle = new TextStyle(
  color: colorInLight,
  fontSize: 32.0,
);
