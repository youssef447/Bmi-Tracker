
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Model/repos/auth_repo.dart';
import '../../config/dependencies/injection.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
  static AuthCubit get(context) => BlocProvider.of(context);

  login({required String email, required String password}) async {
    emit(AuthLoadingState());

    final response =
        await locators.get<AuthRepo>().loginAnonymously();

    response.fold((l) {
      emit(
        AuthErrorState(l.errMessage),
      );
    }, (r) {
      emit(AuthSuccessState());
      
    });
  }
}
