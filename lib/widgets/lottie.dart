import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieFile extends StatelessWidget {
  const LottieFile({
    super.key,
    this.height,
    this.width,
    required this.name,
  });
  final double? height;
  final double? width;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        "assets/jsons/$name.json",
        height: height,
        width: width,
      ),
    );
  }
}
