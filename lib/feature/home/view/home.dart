import 'package:base/utility/extintions.dart';
import 'package:flutter/material.dart';
import '../../../widgets/custom_btn.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomBtn(
              text: "New Student",
              onPressed: () {},
            ),
            SizedBox(height: 32.h),
            CustomBtn(
              text: "My Students",
              onPressed: () {},
              color: context.theme.canvasColor,
              textColor: context.theme.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
