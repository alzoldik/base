import 'package:flutter/material.dart';
import 'package:base/utility/extintions.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    required this.text,
    this.color,
    this.textColor = Colors.white,
    this.onPressed,
    this.width,
    this.height = 50,
    this.borderColor,
  });
  final String text;
  final Color? color;
  final Color? borderColor;
  final Color? textColor;
  final Function()? onPressed;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height?.h,
        width: width,
        decoration: BoxDecoration(
          color: color ?? context.theme.primaryColor,
          border: Border.all(
            color: borderColor ?? context.theme.primaryColor,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                  fontSize: 16,
                ),
          ),
        ),
      ),
    );
  }
}
