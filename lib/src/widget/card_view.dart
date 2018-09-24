import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  CardView({
    this.onTap,
    this.child,
    this.margin,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: GestureDetector(
        onTap: onTap,
        child: Material(
            type: MaterialType.card,
            elevation: 0.5,
            borderRadius: BorderRadius.circular(16.0),
            child:  Padding(
              padding: padding ?? EdgeInsets.all(0.0),
              child: child,
            )),
      ),
    );
  }
}
