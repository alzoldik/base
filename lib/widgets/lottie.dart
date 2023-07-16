import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieFile extends StatelessWidget {
  const LottieFile({
    super.key,
    this.height,
    this.width,
    required this.name,
    this.fit = BoxFit.cover,
  });
  final double? height;
  final double? width;
  final String name;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Center(
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
