import 'package:firebase_core/firebase_core.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServiceFailure extends Failure {
  ServiceFailure(super.errMessage);

  factory ServiceFailure.fromFirebase(FirebaseException err) {
    switch (err.code) {
      case '400' || '401' || '403':
        return ServiceFailure(err.message!);

      case '404':
        return ServiceFailure('Your request not found, Please try later!');

      case '500':
        return ServiceFailure('Internal Server error, Please try later');

      default:
        return ServiceFailure('Opps There was an Error, Please try again');
    }
  }
}
