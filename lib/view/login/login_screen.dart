import 'dart:ui';

import 'package:bmi_tracker/config/extensions/extensions.dart';
import 'package:bmi_tracker/config/routes/routes.dart';
import 'package:bmi_tracker/view/widgets/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/animations/fade_animation.dart';
import '../../core/style/app_assets.dart';
import '../../core/utils/default_dialog.dart';
import '../../view_model/auth/auth_cubit.dart';
import '../../view_model/auth/auth_states.dart';
import '../widgets/default_button.dart';
import '../widgets/default_form_field.dart';
import '../widgets/indicator_loading.dart';

part 'widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.icon,
                height: 120.h,
              ),
              SizedBox(
                height: 30.h,
              ),
              const FadeAnimation(
                downUp: true,
                child: LoginForm(),
              )
            ]),
      ),
    );
  }
}
