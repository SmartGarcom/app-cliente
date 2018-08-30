import 'package:flutter/material.dart';
import 'package:smart_garcom/component/Buttons/roundedButton.dart';
import 'package:smart_garcom/component/loading.dart';
import 'package:smart_garcom/theme/style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  static String tag = 'login-screen';

  @override
  LoginScreenState createState() => new LoginScreenState();
}

enum Steps { LOADING, LOGIN }
Steps step;

class LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    super.initState();
    step = Steps.LOADING;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: new Container(
          padding: new EdgeInsets.all(24.0),
          child: new Center(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: new Icon(
                    Icons.fastfood,
                    color: logoColor,
                    size: 100.0,
                  ),
                ),
//                logo,
                new SizedBox(height: 32.0),
                step == Steps.LOADING
                    ? new Loading()
                    : new RoundedButton(
                  buttonName: 'Fazer login',
                  borderWidth: 0.0,
                  buttonColor: colorInDark,
                  textColor: colorInLight,
                  onTap: () {
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
