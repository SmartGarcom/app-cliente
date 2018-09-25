import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final Widget text;
  final String loadingMessage;

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
