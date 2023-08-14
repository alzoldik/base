import 'package:base/utility/extintions.dart';
import 'package:flutter/material.dart';
import '../../../../utility/route.dart';
import '../../../../widgets/custom_btn.dart';
import '../../../../widgets/pin_code.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                SizedBox(height: 16.h),
                const Text(
                  "Welcome to Razeen",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 16.h),
                const Text(
                  "Waiting to automatically detect an SMS sent to +91 9876543210 with your 6-digit code",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const PinCode(),
            CustomBtn(
              text: "Verify",
              onPressed: () {
                pushNamed(Routes.signup);
              },
            )
          ],
        ),
      ),
    );
  }
}
