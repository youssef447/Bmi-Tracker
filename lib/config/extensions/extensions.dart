import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  //****************//Themes****************//

  TextTheme get textTheme => Theme.of(this).textTheme;

  //****************//ScreenInfo****************//

  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  bool get isTablet => height > 1080 && width < height;

  bool get isDesktop => width > height;
  bool get landScape =>
      MediaQuery.of(this).orientation == Orientation.landscape;

  //****************//routes****************//

  pop() {
    Navigator.of(this).pop();
  }

  goTo({
    required String route,
    Object? args,
  }) {
    Navigator.of(this).pushNamed(route, arguments: args);
  }

  goAndPop({
    required String route,
    List<dynamic>? args,
  }) {
    Navigator.of(this).pushReplacementNamed(route, arguments: args);
  }

  goAndPopUntil({
    required String route,
    List<dynamic>? args,
    required bool Function(Route<dynamic>) predicate,
  }) {
    Navigator.of(this)
        .pushNamedAndRemoveUntil(route, predicate, arguments: args);
  }
}
