import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final double width;
  final double height;
  final BoxShape shape;
  final BoxFit fit;
  final ImageProvider image;

  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  ImageView({
    @required this.image,
    this.width = 24.0,
    this.height = 24.0,
    this.shape = BoxShape.rectangle,
    this.fit = BoxFit.cover,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      width: width,
      height: width,
      decoration: new BoxDecoration(
        shape: shape,
        image: new DecorationImage(
          fit: fit,
          image: image,
        ),
      ),
    );
  }
}
