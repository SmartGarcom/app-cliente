import 'package:flutter/material.dart';

class AppConfiguration {
  AppTheme appTheme;

  AppConfiguration(
      {brightness = Brightness.light, primaryColor = Colors.brown}) {
    appTheme = new AppTheme(brightness: brightness, primaryColor: primaryColor);
  }

  AppConfiguration copyWith({Brightness brightness, Color primaryColor}) {
    return new AppConfiguration(
      brightness: brightness ?? this.brightness,
      primaryColor: primaryColor ?? this.primaryColor,
    );
  }

  set brightness(brightness) => appTheme.brightness = brightness;

  get brightness => appTheme.brightness;

  set primaryColor(primaryColor) => appTheme.primaryColor = primaryColor;

  get primaryColor => appTheme.primaryColor;
}

class AppTheme {
  Brightness brightness;
  Color primaryColor;

  AppTheme(
      {this.brightness = Brightness.light, this.primaryColor = Colors.teal});
}
