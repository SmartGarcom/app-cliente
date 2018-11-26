import 'package:flutter/material.dart';

ThemeData getTheme(
    {Brightness brightness = Brightness.light,
    Color primaryColor = baseColor}) {
  var luminance = primaryColor.computeLuminance();

  /// Verifica se a primaryColor eh escura se o brightness for dark
  assert(brightness == Brightness.light || luminance < 0.5);

  bool isLight = brightness == Brightness.light;

  final Color accentColor = isLight ? primaryColor : Colors.white10;

  final defaultShape = RoundedRectangleBorder(
    borderRadius: new BorderRadius.all(new Radius.circular(16.0)),
  );

  return new ThemeData(
    scaffoldBackgroundColor: isLight ? Colors.grey[200] : Colors.black,
    brightness: brightness,
    primaryColor: primaryColor,
    fontFamily: 'Comfortaa',
//    platform: TargetPlatform.iOS,
//    accentColor: primaryColor,
    buttonColor: accentColor,
    buttonTheme: new ButtonThemeData(textTheme: ButtonTextTheme.primary),
    inputDecorationTheme: InputDecorationTheme(
        border: UnderlineInputBorder(),
        isCollapsed: true,
        isDense: true,
        filled: true,
        labelStyle: luminance > 0.5 ? TextStyle(color: Colors.black54) : null),
    chipTheme: new ChipThemeData.fromDefaults(
      brightness: brightness,
      secondaryColor: accentColor,
      labelStyle: new TextStyle(),
    ).copyWith(
      shape: defaultShape,
      backgroundColor: primaryColor.withOpacity(0.75),
      brightness: brightness,
      secondarySelectedColor: accentColor,
    ),
  );
}

// Logo style
const baseColor = Colors.red;
Color colorInDark = baseColor[100];
Color colorInLight = baseColor[900];
Color logoColor = Colors.yellow;
