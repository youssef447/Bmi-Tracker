import 'package:bmi_tracker/Model/data_sources/bmi_services.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/utils/error_handler.dart';
import '../models/bmi_data.dart';

class BmiRepo {
  late final BmiServices _service;
  BmiRepo({required BmiServices service}) {
    _service = service;
  }

  Future<Either<Failure, bool>> addBmiData({required BmiData model}) async {
    try {
      await _service.addBmiData(
        json: model.toJson(),
      );
      return Right(true);
    } on FirebaseException catch (e) {
      return Left(ServiceFailure.fromFirebase(e));
    } catch (e) {
      return Left(ServiceFailure(e.toString()));
    }
  }

  Future<Either<Failure, bool>> delete(String docId) async {
    try {
      await _service.delete(docId);
      return Right(true);
    } on FirebaseException catch (e) {
      return Left(ServiceFailure.fromFirebase(e));
    } catch (e) {
      return Left(ServiceFailure(e.toString()));
    }
  }

  Future<Either<Failure, bool>> update(
      {required String docId, required BmiData model}) async {
    try {
      await _service.update(
        docId: docId,
        json: model.toJson(),
      );
      return Right(true);
    } on FirebaseException catch (e) {
      return Left(ServiceFailure.fromFirebase(e));
    } catch (e) {
      return Left(ServiceFailure(e.toString()));
    }
  }
}
