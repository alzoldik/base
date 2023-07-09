import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Images extends StatelessWidget {
  const Images({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    String expression = image.splitMapJoin(".");
    switch (expression) {
      case "svg":
        return SvgPicture.asset(image);
      case "png":
        return Image.asset(image);
      case "jpg":
        return Image.asset(image);
      case "jpeg":
        return Image.asset(image);
      default:
        return Image.asset(image);
    }
  }
}
