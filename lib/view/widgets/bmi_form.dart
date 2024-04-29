import 'dart:ui';

import 'package:bmi_tracker/config/extensions/extensions.dart';
import 'package:bmi_tracker/core/utils/default_dialog.dart';
import 'package:bmi_tracker/view/widgets/glass_container.dart';
import 'package:bmi_tracker/view/widgets/indicator_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view_model/user/bmi_cubit.dart';
import '../../view_model/user/bmi_states.dart';
import 'default_button.dart';
import '../bmi_form/bmi_form_screen.dart';
import 'bmi_result_dialog.dart';


class BmiForm extends StatefulWidget {
  final double? heightSliderValue, weightSliderValue, ageSliderValue;
  final String? docId;
  final bool? edit;
  const BmiForm({
    super.key,
    this.heightSliderValue,
    this.weightSliderValue,
    this.ageSliderValue,
    this.edit,
    this.docId,
  });

  @override
  State<BmiForm> createState() => _BmiFormState();
}

class _BmiFormState extends State<BmiForm> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        if (widget.edit ?? false) {
          return BmiCubit()
            ..ageSliderValue = widget.ageSliderValue!
            ..heightSliderValue = widget.heightSliderValue!
            ..weightSliderValue = widget.weightSliderValue!;
        } else {
          return BmiCubit();
        }
      },
      child: BlocConsumer<BmiCubit, BmiStates>(
        builder: (context, state) {
          final cubit = BmiCubit.get(context);

          return GlassCotnainer(
          color:  widget.edit??false?Colors.red.withOpacity(0.1):null,
            child: Column(
              children: [
                SliderInfo(
                  sliderValue: cubit.ageSliderValue,
                  subTitle: 'Age',
                  min: 0,
                  max: 100,
                  onChanged: (value) {
                    cubit.changeAge(value);
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                SliderInfo(
                  sliderValue: cubit.heightSliderValue,
                  subTitle: 'Height',
                  valueHint: ' cm',
                  min: 0,
                  max: 250,
                  onChanged: (value) {
                    cubit.changeHeight(value);
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                SliderInfo(
                  sliderValue: cubit.weightSliderValue,
                  subTitle: 'Weight',
                  valueHint: ' kg',
                  min: 0,
                  max: 250,
                  onChanged: (value) {
                    cubit.changeWeight(value);
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                state is BmiAddLoadingState
                    ? const IndicatorBlurLoading()
                    : DefaultButton(
                        raduis: 10.r,
                        child: Text(
                          widget.edit ?? false ? 'Re-Calculate' : 'Calculate',
                          style: context.textTheme.titleMedium!.copyWith(
                            fontSize: 18.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        onClicked: () {
                          widget.edit ?? false
                              ? cubit.update(widget.docId!)
                              : cubit.calculateBmi();
                        },
                      ),
              ],
            ),
          );
        },
        listener: (BuildContext context, state) {
          final cubit = BmiCubit.get(context);

          if (state is BmiAddSuccessState) {
            AwesomeDialogUtil.sucess(
              context: context,
              body: BmiResultDialog(
                result: cubit.result.toStringAsFixed(2),
                status: cubit.status!,
              ),
              title: 'BMI calculation',
              btnOkOnPress: () {
                context.pop();
              },
            );
          }
          if (state is BmiAddErrorState) {
            AwesomeDialogUtil.error(
              context: context,
              body: state.errMsg,
              title: 'failed',
            );
          }
        },
      ),
    );
  }
}
