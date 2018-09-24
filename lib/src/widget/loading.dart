import 'package:flutter/material.dart';
import 'package:smart_garcom/src/style.dart';

class Loading extends StatelessWidget {
  Widget text;
  String loadingMessage;

  //passing props in react style
  Loading({
    this.text,
    this.loadingMessage,
  });

  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
        text != null || loadingMessage != ''
            ? new Padding(
                padding: const EdgeInsets.all(16.0),
                child: loadingMessage != null ? new Text(loadingMessage) : text,
              )
            : new Container(),
      ],
    );
  }
}
