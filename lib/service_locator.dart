import 'package:get_it/get_it.dart';
import 'package:sptiy_grand/data/repository/auth/auth_repositery.imp.dart';
import 'package:sptiy_grand/data/sources/auth/auth_firebase_service.dart';
import 'package:sptiy_grand/domain/repository/auth/auth.dart';
import 'package:sptiy_grand/domain/usecase/auth/signup.dart';

final sl = GetIt.instance;

Future<void> initilizeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  sl.registerSingleton<AuthRepository>(AuthRepositeryImp());

  sl.registerSingleton<SignupCase>(SignupCase());
}
