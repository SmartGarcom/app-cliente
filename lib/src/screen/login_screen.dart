import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smart_garcom/src/bloc/application_bloc.dart';
import 'package:smart_garcom/src/bloc/bloc_provider.dart';
import 'package:smart_garcom/src/style.dart';
import 'package:smart_garcom/src/widget/ensure_visible_when_focused.dart';
import 'package:smart_garcom/src/widget/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  static String route = 'login-screen';

  LoginScreen();

  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  FocusNode _focusNodeEmail = new FocusNode();
  static final TextEditingController _emailController =
      new TextEditingController();
  FocusNode _focusNodePassword = new FocusNode();
  static final TextEditingController _passwordController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final applicationBloc = BlocProvider.of<ApplicationBloc>(context);

    List colors = [
      Colors.red,
      Colors.green,
      Colors.teal,
      Colors.brown,
      Colors.green,
      Colors.white,
      Colors.grey,
      Colors.yellow,
    ];

    var theme = Theme.of(context);

    return Theme(
            data: getTheme(
                brightness: theme.primaryColor.computeLuminance() > 0.5
                    ? Brightness.light
                    : Brightness.dark,
                primaryColor: theme.primaryColor),
            child: new Scaffold(
              backgroundColor: theme.primaryColor,
              body: new Form(
                key: _formKey,
                child: new SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      /* -- Something large -- */
                      Container(
                        width: double.infinity,
                        height: 150.0,
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: new Icon(
                          Icons.fastfood,
                          color: logoColor,
                          size: 100.0,
                        ),
                      ),
                      new SizedBox(height: 32.0),

                      new EnsureVisibleWhenFocused(
                        focusNode: _focusNodeEmail,
                        child: new TextFormField(
                          decoration: const InputDecoration(labelText: 'Email'),
                          onSaved: (String value) {
                            //TODO
                          },
                          controller: _emailController,
                          focusNode: _focusNodeEmail,
                        ),
                      ),
                      new SizedBox(height: 32.0),

                      new EnsureVisibleWhenFocused(
                        focusNode: _focusNodePassword,
                        child: new TextFormField(
                          decoration: const InputDecoration(labelText: 'Senha'),
                          onSaved: (String value) {
                            //TODO
                          },
                          controller: _passwordController,
                          focusNode: _focusNodePassword,
                        ),
                      ),
                      new SizedBox(height: 32.0),

                      new RoundedButton(
                        buttonName: 'Fazer login',
                        borderWidth: 0.0,
                        buttonColor: colorInDark,
                        textColor: colorInLight,
                        onTap: () {
                          int pos = Random().nextInt(colors.length);
                          print(pos);
                          var color = colors[pos];
                          applicationBloc.primaryColor.add(color);
                          print(color.computeLuminance());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
