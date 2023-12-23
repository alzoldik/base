import 'package:base/widgets/app_loading.dart';
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
    this.border = 0,
  });
  final String image;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Color? color;
  final double border;

  @override
  Widget build(BuildContext context) {
    if (image.contains("http")) {
      try {
        return ClipRRect(
          borderRadius: BorderRadius.circular(border),
          child: Image.network(
            image,
            fit: fit,
            width: width,
            height: height,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.error),
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const AppLoading();
            },
          ),
        );
      } catch (e) {
        return const Center(child: Icon(Icons.error));
      }
    } else {
      List<String> expression = image.split(".");
      switch (expression.last) {
        case "svg":
          return SvgPicture.asset(
            image,
            height: height,
            width: width,
            fit: fit,
            colorFilter: color != null
                ? ColorFilter.mode(color!, BlendMode.srcIn)
                : null,
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
}
