
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/style/app_colors.dart';
import 'humidity_radial_gauge.dart';

class BmiResultDialog extends StatelessWidget {
  final String result, status;
  const BmiResultDialog(
      {super.key, required this.result, required this.status});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BmiRadialGauge(
          needleValue: double.parse(result),
          height: 150.h,
        ),
        Text(
          result,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.defaultColor,
              ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          'kg/m2',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Colors.grey,
              ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          status,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.defaultColor,
              ),
        ),
      ],
    );
  }
}
