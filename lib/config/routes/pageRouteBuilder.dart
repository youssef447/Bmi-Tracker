import 'package:flutter/material.dart';

class DefaultPageRouteBuilder {
  static defaultRoute({
    required Widget screen,
  }) {
    return MaterialPageRoute(
      builder: (context) {
        return screen;
      },
    );
  }

  static animatedLeftDownRoute({
    required Widget screen,
  }) {
    return PageRouteBuilder(
      transitionDuration: const Duration(
        milliseconds: 400,
      ),
      //this is like adjustion animation controller that is built in
      reverseTransitionDuration: const Duration(
        milliseconds: 400,
      ),
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(-1.0, 0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween<Offset>(
          begin: begin,
          end: end,
        ).chain(
          CurveTween(curve: curve),
        );

        return SlideTransition(
          position: tween.animate(animation), // animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
