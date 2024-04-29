import 'package:bmi_tracker/config/extensions/extensions.dart';
import 'package:bmi_tracker/core/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BmiRadialGauge extends StatelessWidget {
  final double needleValue;
  final double? height;
final Color?color;
  const BmiRadialGauge({super.key, required this.needleValue, this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: SfRadialGauge(
        enableLoadingAnimation: true,
        axes: [
          RadialAxis(
            minimum: 13,
            maximum: 42.5,
            showAxisLine: false,
            ranges: [
              GaugeRange(
                startValue: 13,
                endValue: 18.5,
                rangeOffset: -15,
                label: 'Underweight',
                labelStyle: GaugeTextStyle(
                  color: color??Colors.black,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
                color: Colors.transparent,
              ),
              GaugeRange(
                startValue: 18.5,
                endValue: 24.9,
                rangeOffset: -15,
                label: 'Normal',
                labelStyle: GaugeTextStyle(
                  color: color??Colors.black,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
                color: Colors.transparent,
              ),
              GaugeRange(
                startValue: 25,
                endValue: 30,
                rangeOffset: -15,
                label: 'Overweight',
                labelStyle: GaugeTextStyle(
                  color: color??Colors.black,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
                color: Colors.transparent,
              ),
              GaugeRange(
                startValue: 30,
                endValue: 42.5,
                rangeOffset: -15,
                label: 'Obesity',
                labelStyle: GaugeTextStyle(
                  color: color??Colors.black,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
                color: Colors.transparent,
              ),
              GaugeRange(
                startValue: 13,
                endValue: 16,
                color: Color(0xffba2020),
                startWidth: 22,
                endWidth: 22,
              ),
              GaugeRange(
                startValue: 16,
                endValue: 17,
                color: Color(0xffd38789),
                startWidth: 22,
                endWidth: 22,
              ),
              GaugeRange(
                startValue: 17,
                endValue: 18.5,
                color: Color(0xffffe401),
                startWidth: 22,
                endWidth: 22,
              ),
              GaugeRange(
                startValue: 18.5,
                endValue: 25,
                color: Color(0xff018136),
                startWidth: 22,
                endWidth: 22,
              ),
              GaugeRange(
                startValue: 25,
                endValue: 30,
                color: Color(0xffffe401),
                startWidth: 22,
                endWidth: 22,
              ),
              GaugeRange(
                startValue: 30,
                endValue: 35,
                color: Color(0xffd38787),
                startWidth: 22,
                endWidth: 22,
              ),
              GaugeRange(
                startValue: 35,
                endValue: 40,
                color: Color(0xffba2020),
                startWidth: 22,
                endWidth: 22,
              ),
              GaugeRange(
                startValue: 40,
                endValue: 42.5,
                color: Color(0xff8b0003),
                startWidth: 22,
                endWidth: 22,
              ),
            ],
            axisLabelStyle: GaugeTextStyle(fontSize: 0.sp),
            pointers: <GaugePointer>[
              NeedlePointer(
                value: needleValue,
                enableAnimation: true,
                needleEndWidth: 2,
                needleStartWidth: 0.1,
                needleColor: color,
                knobStyle: KnobStyle(color: color),
              )
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Text(
                  'BMI=${needleValue.toStringAsFixed(2)}',
                  style: context.textTheme.titleSmall!.copyWith(
                    color: color??AppColors.defaultColor.withOpacity(0.5),
                    //height: 1.3,
                  ),
                ),
                angle: 90,
                positionFactor: 0.4,
              )
            ],
          ),
        ],
      ),
    );
  }
}
