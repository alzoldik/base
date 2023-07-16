import 'package:base/bloc/setting/setting_bloc.dart';
import 'package:base/entities/app_settings.dart';
import 'package:base/feature/auth/login/view/login.dart';
import 'package:base/utility/extintions.dart';
import 'package:base/utility/route.dart';
import 'package:base/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/lottie.dart';

class OnBording extends StatelessWidget {
  const OnBording({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 70.h),
            StreamBuilder<AppSettings>(
              stream: context.read<SettingsBloc>().settings,
              builder: (context, snapshot) {
                return IconButton(
                  onPressed: () {
                    context.read<SettingsBloc>().darkMode(
                          !context
                              .read<SettingsBloc>()
                              .currentSettings
                              .lightTheme,
                        );
                  },
                  icon: snapshot.data?.lightTheme == true
                      ? const Icon(Icons.dark_mode)
                      : const Icon(Icons.light_mode),
                  iconSize: 50,
                );
              },
            ),
            Expanded(
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
                      onPressed: () {
                        push(const LoginView());
                      },
                    ),
                  ),
                  SizedBox(height: 16.h),
                  GestureDetector(
                    onTap: () {
                      context.read<SettingsBloc>().isArabic(!context
                          .read<SettingsBloc>()
                          .currentSettings
                          .isArabic);
                    },
                    child: Text(
                      context.L.language,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 88.h)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
