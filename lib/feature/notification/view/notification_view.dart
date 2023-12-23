import 'package:base/utility/extintions.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notification View")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Notification View",
              )
            ],
          ),
        ),
      ),
    );
  }
}
