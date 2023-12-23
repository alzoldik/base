import 'package:base/widgets/app_loading.dart';
import 'package:flutter/material.dart';
import 'package:base/utility/extintions.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    required this.text,
    this.color,
    this.textColor,
    this.onPressed,
    this.width,
    this.height = 50,
    this.loading = false,
    this.active = true,
  });
  final String text;
  final Color? color;
  final Color? textColor;
  final Function()? onPressed;
  final double? width;
  final double? height;
  final bool loading;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (loading) return;
        if (active) onPressed?.call();
      },
      child: Opacity(
        opacity: active ? 1 : 0.6,
        child: Container(
          height: height?.h,
          width: width,
          decoration: BoxDecoration(
            color: color ?? context.color.primary,
            borderRadius: BorderRadius.circular(15),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.4),
            //     spreadRadius: 5,
            //     blurRadius: 7,
            //     offset: const Offset(0, 3),
            //   ),
            // ],
          ),
          child: Center(
            child: loading
                ? const AppLoading()
                : Text(
                    text,
                    style: context.textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: textColor ?? context.color.background,
                      fontSize: 16,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
