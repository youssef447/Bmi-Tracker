import 'package:bmi_tracker/config/extensions/extensions.dart';
import 'package:bmi_tracker/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/dependencies/injection.dart';
import 'config/routes/routeGenerator.dart';
import 'config/services/cach_helper.dart';
import 'core/style/app_theme.dart';
import 'view/home/home_screen.dart';
import 'view/login/login_screen.dart';
import 'view_model/auth/auth_cubit.dart';

bool isLoggedIn() {
  if (FirebaseAuth.instance.currentUser != null) {
    // signed in
    return true;
  } else {
    // signed out
    return false;
  }
}

void main() async {
  late Widget home;
  //s
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.light,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  configurationDependencies();

  await CacheHelper.init();

  if (isLoggedIn()) {
    //token=checkToken;

    home = const HomeScreen();
  } else {
    home = const LoginScreen();
  }
  // home=const LoginScreen();

  runApp(MyApp(home: home));
}

class MyApp extends StatelessWidget {
  final Widget home;
  const MyApp({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize:
            context.isDesktop ? const Size(1000, 800) : const Size(428, 926),
        fontSizeResolver: /* context.isDesktop
          ? (fontSize, instance) => FontSizeResolvers.width(fontSize, instance)
          : */
            (fontSize, instance) =>
                FontSizeResolvers.height(fontSize, instance),
        builder: (context, _) {
          return BlocProvider(
            create: (context) => AuthCubit(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'BMI Tracker',
              theme: AppTheme.defaultTheme,
              home: home,
              onGenerateRoute: RouteGenerator.onGenerateRoute,
              //   initialRoute: AppRoutes.homeScreen,
            ),
          );
        });
  }
}
