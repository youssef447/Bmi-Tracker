import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData defaultTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.defaultColor,
    appBarTheme: const AppBarTheme(
      //actionsIconTheme: IconThemeData(color: Colors.black),
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
      titleSpacing: 20.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.defaultColor,
      ),
      backgroundColor: AppColors.defaultColor,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: AppColors.defaultGreyColor,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStateProperty.all(Colors.white),
      ),
    ),
    dividerTheme: const DividerThemeData(
      thickness: 1.5,
      color: Colors.white,
    ),
    sliderTheme: SliderThemeData(
      showValueIndicator: ShowValueIndicator.always,
      activeTrackColor: AppColors.defaultColor,
      activeTickMarkColor: AppColors.defaultColor,
      thumbColor: AppColors.defaultColor,
      valueIndicatorTextStyle: TextStyle(
        color: Colors.white,
        fontFamily: 'segoe',
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'segoe',
        color: Colors.white,
        fontSize: 22.sp,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        fontFamily: 'segoe',
        color: Colors.white,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        fontFamily: 'segoe',
        color: Colors.white,
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
