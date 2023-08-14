import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Images extends StatelessWidget {
  const Images({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.color,
  });
  final String image;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Color? color;

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
          colorFilter:
              color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
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
