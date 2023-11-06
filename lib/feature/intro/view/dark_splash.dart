import 'package:base/app/app_event.dart';
import 'package:base/app/app_state.dart';
import 'package:base/feature/intro/view/onbording.dart';
import 'package:base/utility/extintions.dart';
import 'package:base/utility/route.dart';
import 'package:base/widgets/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/splash_bloc.dart';

class DarkSplash extends StatelessWidget {
  const DarkSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: BlocProvider(
        create: (context) => SplashBloc()..add(Click()),
        child: BlocListener<SplashBloc, AppState>(
          listener: (context, state) {
            if (state is Done) {
              push(const OnBording());
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Hero(
                    tag: "splash",
                    child: LottieFile(name: "splash"),
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
      ),
    );
  }
}
