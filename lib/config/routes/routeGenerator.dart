import 'package:flutter/material.dart';

import '../../view/bmi_form/bmi_form_screen.dart';
import '../../view/home/home_screen.dart';
import '../../view/login/login_screen.dart';
import 'pageRouteBuilder.dart';
import 'routes.dart';

class RouteGenerator {
  RouteGenerator._();
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    //final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.loginScreen:
        return DefaultPageRouteBuilder.defaultRoute(
          screen: const LoginScreen(),
        );

      case AppRoutes.homeScreen:
        return DefaultPageRouteBuilder.animatedLeftDownRoute(
            screen: const HomeScreen());
      case AppRoutes.bmiScreen:
        return DefaultPageRouteBuilder.animatedLeftDownRoute(
          screen: const BmiFormScreen(),
        );
    }
    return MaterialPageRoute(
      builder: (context) => const Center(
        child: Text('Unknown Screen'),
      ),
    );
  }
}
