import 'package:base/utility/extintions.dart';
import 'package:base/utility/keybord_lisenter.dart';
import 'package:base/utility/route.dart';
import 'package:base/widgets/custom_text_field.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../../../../utility/utility.dart';
import '../../../../widgets/custom_btn.dart';
import '../../../../widgets/lottie.dart';
import '../../otp/view/otp_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.L.signin),
      ),
      body: StreamBuilder<bool>(
        stream: keyboard.currentKayboardState,
        initialData: false,
        builder: (context, snapshot) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const Hero(
                    tag: "splash",
                    child: LottieFile(
                      name: "splash",
                    ),
                  ),
                  SizedBox(height: 16.h),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: snapshot.data! ? 0 : 130.h,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            context.L.welcome_to_Razeen,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            context.L.log_in_and_start_your_educational_journey,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomTextField(
                    hint: context.L.phone_number,
                    onChanged: (p0) {},
                  ),
                  SizedBox(height: 24.h),
                  Hero(
                    tag: "btn",
                    child: CustomBtn(
                      text: context.L.login,
                      onPressed: () {
                        FirebaseMessaging.instance.getToken().then(
                              (value) => cprint(value),
                            );
                        push(const OtpView());
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
