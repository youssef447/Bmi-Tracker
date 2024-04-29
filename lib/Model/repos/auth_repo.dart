import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/utils/error_handler.dart';
import '../data_sources/auth_service.dart';

class AuthRepo {
  late final AuthService _service;
  AuthRepo({required AuthService service}) {
    _service = service;
  }

  ///returns token
  Future<Either<Failure, String?>> loginAnonymously() async {
    try {
      final response = await _service.loginAnonymously();

      return Right(
        response.user?.uid,
      );
    } on FirebaseException catch (e) {
      return Left(ServiceFailure.fromFirebase(e));
    } catch (e) {
      return Left(ServiceFailure(e.toString()));
    }
  }

  Future<Either<Failure, bool>> logout() async {
    try {
      await _service.logout();
      return Right(true);
    } on FirebaseException catch (e) {
      return Left(ServiceFailure.fromFirebase(e));
    } catch (e) {
      return Left(ServiceFailure(e.toString()));
    }
  }
}
