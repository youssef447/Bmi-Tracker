
import 'package:bmi_tracker/config/extensions/extensions.dart';
import 'package:bmi_tracker/core/style/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/animations/fade_animation.dart';

import '../widgets/bmi_form.dart';
part '../widgets/slider_info.dart';

class BmiFormScreen extends StatefulWidget {
  const BmiFormScreen({super.key});

  @override
  State<BmiFormScreen> createState() => _BmiFormScreenState();
}

class _BmiFormScreenState extends State<BmiFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  FadeAnimation(
                    child: Image.asset(
                      'assets/icon.png',
                      height: 200.h,
                    ),
                  ),
                  Text(
                    'Calculate your BMI',
                    style: context.textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  FadeAnimation(
                    downUp: true,
                    child: BmiForm(),
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
