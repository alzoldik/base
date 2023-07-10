import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Images extends StatelessWidget {
  const Images({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
  });
  final String image;
  final double? height;
  final double? width;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    List<String> expression = image.split(".");
    switch (expression.last) {
      case "svg":
        return SvgPicture.asset(
          image,
          height: height,
          width: width,
          fit: fit,
        );
      case "png":
        return Image.asset(
          image,
          height: height,
          width: width,
          fit: fit,
        );
      case "jpg":
        return Image.asset(
          image,
          height: height,
          width: width,
          fit: fit,
        );
      case "jpeg":
        return Image.asset(
          image,
          height: height,
          width: width,
          fit: fit,
        );
      default:
        return Image.asset(
          image,
          height: height,
          width: width,
          fit: fit,
        );
    }
  }
}
