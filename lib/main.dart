import 'package:flutter/material.dart';
import 'package:smart_garcom/app_configuration.dart';
import 'package:smart_garcom/screen/cardapio_screen.dart';
import 'package:smart_garcom/screen/login_screen.dart';
import 'package:smart_garcom/theme/style.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppConfiguration _configuration = new AppConfiguration();

  @override
  void initState() {
    super.initState();
  }

  void configurationUpdater(AppConfiguration value) {
    setState(() {
      _configuration = value;
    });
  }

  ThemeData get theme {
    assert(_configuration != null);
    return getTheme(
      brightness: _configuration.brightness,
      primaryColor: _configuration.primaryColor,
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    //TODO IMPLEMENT
    final List<String> path = settings.name.split('/');
    if (path[0] != '') return null;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Uniun',
      theme: theme,
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) =>
//            new LoginScreen(_configuration, configurationUpdater),
//        CardapioScreen.tag: (BuildContext context) =>
        new CardapioScreen(_configuration, configurationUpdater),
      },
      onGenerateRoute: _getRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() => runApp(new MyApp());
