import 'package:base/feature/auth/login/view/login.dart';
import 'package:base/feature/auth/otp/view/otp_view.dart';
import 'package:base/feature/auth/singup/view/signup.dart';
import 'package:base/feature/home/view/home_view.dart';
import 'package:base/feature/intro/view/dark_splash.dart';
import 'package:base/feature/main_page.dart';
import 'package:base/feature/notification/view/notification_view.dart';
import 'package:flutter/material.dart';
import '../feature/intro/view/light_splash.dart';
import '../feature/intro/view/onbording.dart';

final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

enum Routes {
  lightSplash,
  darkSplash,
  onBording,
  home,
  login,
  signup,
  otp,
  mainPage,
  forgetPassword,
  profile,
  changePassword,
  changeLanguage,
  profileEdit,
  chat,
}

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  Routes.lightSplash.name: (context) => const LightSplash(),
  Routes.darkSplash.name: (context) => const DarkSplash(),
  Routes.onBording.name: (context) => const OnBording(),
  Routes.home.name: (context) => const HomeView(),
  Routes.login.name: (context) => const LoginView(),
  Routes.signup.name: (context) => const SignUpView(),
  Routes.otp.name: (context) => const OtpView(),
  Routes.mainPage.name: (context) => const MainPage(),
  Routes.profile.name: (context) => const ProfileView(),
};

pushNamed(
  Routes route, {
  arguments,
  bool replace = false,
  bool clean = false,
}) async {
  if (clean) {
    return await navigator.currentState!.pushNamedAndRemoveUntil(
      route.name,
      (_) => false,
      arguments: arguments,
    );
  } else if (replace) {
    return await navigator.currentState!.pushReplacementNamed(
      route.name,
      arguments: arguments,
    );
  } else {
    return await navigator.currentState!.pushNamed(
      route.name,
      arguments: arguments,
    );
  }
}

push(Widget child) async => Navigator.of(navigator.currentContext!)
    .push(CustomPageRoute(builder: (context) => child));

replacement(Widget child) => Navigator.of(
      navigator.currentContext!,
    ).pushReplacement(
      CustomPageRoute(
        builder: (context) => child,
      ),
    );

pushAndRemoveUntil(Widget child) => Navigator.of(
      navigator.currentContext!,
    ).pushAndRemoveUntil(
      CustomPageRoute(builder: (context) => child),
      (route) => false,
    );

pushReplacement(Widget child) =>
    Navigator.of(navigator.currentContext!).pushReplacement(
      CustomPageRoute(builder: (context) => child),
    );

pushFade(Widget child) async => Navigator.push(
      navigator.currentContext!,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => child,
        transitionsBuilder: (c, anim, a2, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 600),
      ),
    );

replacementFade(Widget child) async => Navigator.pushReplacement(
      navigator.currentContext!,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => child,
        transitionsBuilder: (c, anim, a2, child) => FadeTransition(
          opacity: anim,
          child: child,
        ),
        transitionDuration: const Duration(milliseconds: 600),
      ),
    );
pushAndRemoveUntilFade(Widget child) async => Navigator.pushAndRemoveUntil(
      navigator.currentContext!,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => child,
        transitionsBuilder: (c, anim, a2, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 600),
      ),
      (route) => false,
    );

pushUp(Widget child) => Navigator.of(navigator.currentContext!).push(
      PageRouteBuilder(
        transitionDuration: const Duration(seconds: 10),
        transitionsBuilder: (c, anim, a2, child) => child,
        opaque: false,
        pageBuilder: (_, __, ___) => child,
      ),
    );
pushAndRemoveUntilUP(Widget child) =>
    Navigator.of(navigator.currentContext!).pushAndRemoveUntil(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, __, ___) => child,
      ),
      (route) => false,
    );

class CustomPageTransitionBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      FadeTransition(
        opacity: animation,
        child: child,
      );
}

class CustomPageRoute extends MaterialPageRoute {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 1000);

  CustomPageRoute({builder}) : super(builder: builder);
}
