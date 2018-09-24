import 'package:flutter/material.dart';

ThemeData getTheme({Brightness brightness, Color primaryColor}) {
  bool isLight = brightness == Brightness.light;
  final Color accentColor = isLight ? primaryColor : Colors.white;
  final _defaultShape = RoundedRectangleBorder(
    borderRadius: new BorderRadius.all(new Radius.circular(16.0)),
  );

  return new ThemeData(
//    platform: TargetPlatform.iOS,
    brightness: brightness,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: isLight ? Colors.grey[200] : null,
    fontFamily: 'Comfortaa',
    buttonColor: accentColor,
    buttonTheme: new ButtonThemeData(textTheme: ButtonTextTheme.primary),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(),
      isCollapsed: true,
      isDense: true,
      filled: true,
    ),
    chipTheme: new ChipThemeData.fromDefaults(
      brightness: brightness,
      secondaryColor: accentColor,
      labelStyle: new TextStyle(),
    ).copyWith(
      shape: _defaultShape,
      backgroundColor: primaryColor.withOpacity(0.75),
      brightness: brightness,
      secondarySelectedColor: accentColor,
    ),
  );
}

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
