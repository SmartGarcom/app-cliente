

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_garcom/src/bloc/application_bloc.dart';
import 'package:smart_garcom/src/bloc/bloc_provider.dart';
import 'package:smart_garcom/src/style.dart';

class ForgottenPasswordScreen extends StatefulWidget{
  static String route = "forgottenPassword_screen";
  @override
  State<StatefulWidget> createState() => new ForggottenPasswordState();
    // TODO: implement createState
}

class ForggottenPasswordState extends State<ForgottenPasswordScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final applicationBloc = BlocProvider.of<ApplicationBloc>(context);

    var theme = Theme.of(context);

    return Theme(
        data: getTheme(
        brightness: theme.primaryColor.computeLuminance() > 0.5
        ? Brightness.light
        : Brightness.dark,
    primaryColor: theme.primaryColor),
    child: new Scaffold(
    backgroundColor: theme.primaryColor,
    body: new Form()
    )
    );
  }
}