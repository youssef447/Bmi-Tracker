
abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthSuccessState extends AuthStates {
 AuthSuccessState();
}

class AuthErrorState extends AuthStates {
  final String errMessage;

 AuthErrorState(
    this.errMessage,
  );
}

