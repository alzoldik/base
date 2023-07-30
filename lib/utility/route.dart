import 'package:flutter/material.dart';
import 'package:base/main.dart';

push(Widget child) async => Navigator.of(navigator.currentContext!).push(
      CustomPageRoute(builder: (context) => child),
    );

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
      CustomPageRoute(
        builder: (context) => child,
      ),
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
