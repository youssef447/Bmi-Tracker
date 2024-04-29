import 'package:bmi_tracker/Model/models/bmi_data.dart';
import 'package:bmi_tracker/Model/repos/bmi_repo.dart';
import 'package:bmi_tracker/config/dependencies/injection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bmi_states.dart';

class BmiCubit extends Cubit<BmiStates> {
  BmiCubit() : super(BmiInitialState());
  static BmiCubit get(context) => BlocProvider.of(context);
  late double result;
  double ageSliderValue = 1;
  double heightSliderValue = 1;
  double weightSliderValue = 1;
  String? status;

  changeHeight(double height) {
    heightSliderValue = height;
    emit(ChangeDataState());
  }

  changeAge(double age) {
    ageSliderValue = age;
    emit(ChangeDataState());
  }

  changeWeight(double weight) {
    weightSliderValue = weight;
    emit(ChangeDataState());
  }

  update(String docId) {
    emit(BmiAddLoadingState());
    final heightInMeter = heightSliderValue / 100;
    result = weightSliderValue / (heightInMeter * heightInMeter);
    calculateBmiStatus();
    updateBmiData(docId);
  }

  calculateBmi() {
    emit(BmiAddLoadingState());
    final heightInMeter = heightSliderValue / 100;
    result = weightSliderValue / (heightInMeter * heightInMeter);
    calculateBmiStatus();
    addBmiData();
  }

  calculateBmiStatus() {
    if (result < 18.5) {
      status = 'Underweight';
    } else if (result < 24.9) {
      status = 'Normal';
    } else if (result < 30) {
      status = 'Overweight';
    } else {
      status = 'Obesity';
    }
  }

  addBmiData() async {
    BmiData model = BmiData(
      currentTime: Timestamp.fromDate(DateTime.now()),
      weight: weightSliderValue,
      height: heightSliderValue,
      age: ageSliderValue.toInt(),
      status: status!,
      score: result,
    );
    final response = await locators.get<BmiRepo>().addBmiData(model: model);
    response.fold((l) {
      emit(
        BmiAddErrorState(l.errMessage),
      );
    }, (r) {
      emit(BmiAddSuccessState());
    });
  }

  updateBmiData(String docId) async {
    BmiData model = BmiData(
      currentTime: Timestamp.fromDate(DateTime.now()),
      weight: weightSliderValue,
      height: heightSliderValue,
      age: ageSliderValue.toInt(),
      status: status!,
      score: result,
    );
    final response =
        await locators.get<BmiRepo>().update(docId: docId, model: model);
    response.fold((l) {
      emit(
        BmiAddErrorState(l.errMessage),
      );
    }, (r) {
      emit(BmiAddSuccessState());
    });
  }
}
