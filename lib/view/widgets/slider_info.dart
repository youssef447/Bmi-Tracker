part of '../bmi_form/bmi_form_screen.dart';
class SliderInfo extends StatelessWidget {
  final double sliderValue;
  final double? min, max;
  final String?valueHint;
  final void Function(double)? onChanged;
  final String subTitle;
  const SliderInfo({
    super.key,
    required this.sliderValue,
    required this.subTitle,
    this.max,
    this.min,
    this.onChanged, this.valueHint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider.adaptive(
          value: sliderValue,
          label: sliderValue.toInt().toString(),
          min: min??0,
          max: max??100,
          onChanged: onChanged,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$subTitle :',
              style: context.textTheme.titleMedium,
            ),
            SizedBox(
              width: 22.w,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: AppColors.defaultColor.withOpacity(0.7),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Text(
                '${sliderValue.toInt()}${valueHint??''}',
                style: context.textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
