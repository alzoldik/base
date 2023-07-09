import 'package:base/app/app_event.dart';
import 'package:base/app/app_state.dart';
import 'package:base/feature/intro/bloc/splash_bloc.dart';
import 'package:base/feature/main_page.dart';
import 'package:base/utility/route.dart';
import 'package:base/widgets/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SplashBloc()..add(Click()),
        child: BlocListener<SplashBloc, AppState>(
          listener: (context, state) {
            if (state is Done) {
              pushAndRemoveUntil(const MainPage());
            }
          },
          child: const Padding(
            padding: EdgeInsets.all(24.0),
            child: LottieFile(
              name: "splash",
            ),
          ),
        ),
      ),
    );
  }
}
