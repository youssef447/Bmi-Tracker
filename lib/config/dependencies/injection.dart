

import 'package:get_it/get_it.dart';

import '../../Model/data_sources/auth_service.dart';
import '../../Model/data_sources/bmi_services.dart';
import '../../Model/repos/auth_repo.dart';
import '../../Model/repos/bmi_repo.dart';


final locators = GetIt.instance;

configurationDependencies() {
  locators.registerLazySingleton(
    () => AuthRepo(
      service: AuthService(),
    ),
  );  locators.registerLazySingleton(
    () => BmiRepo(
      service: BmiServices(),
    ),
  );
}
