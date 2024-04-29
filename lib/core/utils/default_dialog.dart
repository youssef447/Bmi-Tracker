// ignore_for_file: deprecated_member_use

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bmi_tracker/config/extensions/extensions.dart';
import 'package:bmi_tracker/core/style/app_colors.dart';
import 'package:flutter/material.dart';

class AwesomeDialogUtil {
  AwesomeDialogUtil._();
  static sucess({
    required BuildContext context,
    required Widget body,
    required String title,
    Duration? duration,
    Function()? btnOkOnPress,
  }) {
    AwesomeDialog(
      context: context,
      dialogBorderRadius: BorderRadius.circular(30),
      body: body,
      autoHide: duration,
      title: title,
      dialogType: DialogType.success,
      padding: const EdgeInsets.all(15),
      buttonsTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
      titleTextStyle: context.textTheme.titleMedium!.copyWith(
        color: AppColors.defaultColor,
      ),
      btnOkOnPress: btnOkOnPress ?? () {},
    ).show();
  }

  static error({
    required BuildContext context,
    String? msg,
    required String body,
    required String title,
    Function()? btnOkOnPress,
  }) {
    AwesomeDialog(
      dialogBorderRadius: BorderRadius.circular(30),
      context: context,
      body: msg == null
          ? Text(
              body,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.defaultColor,
                  ),
            )
          : Text(
              "$body , $msg",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.defaultColor,
                  ),
            ),
      title: title,
      titleTextStyle: context.textTheme.titleMedium!.copyWith(
        color: AppColors.defaultColor,
      ),
      dialogType: DialogType.error,
      buttonsTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
      padding: const EdgeInsets.all(15),
      btnOkOnPress: btnOkOnPress ?? () {},
    ).show();
  }
}
