import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  String buttonName;
  final VoidCallback onTap;

  double width;
  double bottomMargin;
  double borderWidth;
  Color buttonColor;
  Color textColor;
  bool rounded;

  //passing props in react style
  RoundedButton({
    this.buttonName,
    this.onTap,
    this.bottomMargin,
    this.borderWidth,
    this.width,
    this.buttonColor,
    this.textColor,
    this.rounded,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = new TextStyle(
        color: textColor == null ? new Color(0XFFFFFFFF) : textColor,
        fontSize: 16.0,
        fontWeight: FontWeight.bold);

    double corner = rounded == null || rounded ? 30.0 : 0.0;

    if (borderWidth != 0.0)
      return (new InkWell(
        onTap: onTap,
        child: new Container(
          width: width,
          height: 50.0,
          margin: new EdgeInsets.only(bottom: bottomMargin),
          alignment: FractionalOffset.center,
          decoration: new BoxDecoration(
              color: buttonColor,
              borderRadius: new BorderRadius.all(new Radius.circular(corner)),
              border: new Border.all(
                  color: const Color.fromRGBO(221, 221, 221, 1.0),
                  width: borderWidth)),
          child: new Text(buttonName, style: textStyle),
        ),
      ));
    else
      return (new InkWell(
        onTap: onTap,
        child: new Container(
          width: width,
          height: 50.0,
          margin: new EdgeInsets.only(bottom: bottomMargin == null ? 0.0 : bottomMargin),
          alignment: FractionalOffset.center,
          decoration: new BoxDecoration(
            color: buttonColor,
            borderRadius: new BorderRadius.all(new Radius.circular(corner)),
          ),
          child: new Text(buttonName, style: textStyle),
        ),
      ));
  }
}
