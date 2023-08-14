import 'package:base/utility/extintions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieFile extends StatelessWidget {
  const LottieFile({
    super.key,
    this.height,
    this.width,
    required this.name,
    this.fit = BoxFit.cover,
    this.color,
  });
  final double? height;
  final double? width;
  final String name;
  final BoxFit fit;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        color ?? context.theme.primaryColor.withOpacity(0.5),
        BlendMode.srcATop,
      ),
      child: Lottie.asset(
        "assets/json/$name.json",
        height: height,
        width: width,
        fit: fit,
        options: LottieOptions(enableMergePaths: true),
        filterQuality: FilterQuality.high,
      ),
    );
  }
}
