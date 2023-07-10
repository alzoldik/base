import 'package:base/feature/auth/login/view/login.dart';
import 'package:base/utility/extintions.dart';
import 'package:base/utility/route.dart';
import 'package:base/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import '../../../widgets/lottie.dart';

class OnBording extends StatelessWidget {
  const OnBording({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 108.h),
              Expanded(
                child: Column(
                  children: [
                    const Hero(
                      tag: "splash",
                      child: LottieFile(name: "splash"),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      context.L.welcome_to_Razeen,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      context.L.join_our_community_and_now_for_free,
                      // "Join our community and now for free",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Hero(
                tag: "btn",
                child: CustomBtn(
                  text: context.L.get_start,
                  // "Get Started",
                  onPressed: () {
                    push(const LoginView());
                  },
                ),
              ),
              SizedBox(height: 72.h)
            ],
          ),
        ),
      ),
    );
  }
}
