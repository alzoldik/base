import 'package:base/app/app_event.dart';
import 'package:base/app/app_state.dart';
import 'package:base/config/colors/light_colors.dart';
import 'package:base/utility/extintions.dart';
import 'package:base/utility/route.dart';
import 'package:base/widgets/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/splash_bloc.dart';
import 'onbording.dart';

class LightSplash extends StatelessWidget {
  const LightSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColor.offWhite,
      body: BlocProvider(
        create: (context) => SplashBloc()..add(Click()),
        child: BlocListener<SplashBloc, AppState>(
          listener: (context, state) {
            if (state is Done) {
              pushAndRemoveUntil(const OnBording());
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Hero(
                  tag: "splash",
                  child: LottieFile(
                    name: "splash",
                  ),
                ),
                Text(
                  context.L.loading,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
