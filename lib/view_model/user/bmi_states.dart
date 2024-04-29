abstract class BmiStates {}

class BmiInitialState extends BmiStates {}

class ChangeDataState extends BmiStates {}

class BmiAddLoadingState extends BmiStates {}

class BmiAddSuccessState extends BmiStates {}

class BmiAddErrorState extends BmiStates {
  final String errMsg;
  BmiAddErrorState(
    this.errMsg,
  );
}
