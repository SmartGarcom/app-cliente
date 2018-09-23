import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  Icon icon;
  String hintText;
  TextInputType textInputType;
  Color textFieldColor, iconColor;
  bool obscureText;
  double bottomMargin;
  TextStyle textStyle, hintStyle;
  var validateFunction;
  var onSaved;
  Key key;
  TextAlign textAlign;
  TextEditingController controller;

  //passing props in the Constructor.
  //Java like style
  InputField(
      {this.key,
      this.hintText,
      this.obscureText,
      this.textInputType,
      this.textFieldColor,
      this.icon,
      this.bottomMargin,
      this.textStyle,
      this.validateFunction,
      this.onSaved,
      this.hintStyle,
      this.textAlign,
      this.controller});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (new Container(
        margin: new EdgeInsets.only(bottom: bottomMargin),
        child: new DecoratedBox(
          decoration: new BoxDecoration(
              borderRadius: new BorderRadius.all(new Radius.circular(30.0)),
              color: textFieldColor),
          child: new TextFormField(
            style: textStyle,
            key: key,
            obscureText: obscureText,
            controller: controller,
            keyboardType: textInputType,
            validator: validateFunction,
            textAlign: textAlign != null ? textAlign : TextAlign.start,
            onSaved: onSaved,
            decoration: new InputDecoration(
              contentPadding: new EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
              hintText: hintText,
              hintStyle: hintStyle,
              prefixIcon: icon,
              border: InputBorder.none,
            ),
          ),
        )));
  }
}
