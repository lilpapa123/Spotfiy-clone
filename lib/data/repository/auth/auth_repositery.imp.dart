import 'package:dartz/dartz.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:sptiy_grand/data/models/auth/create_user_req.dart';
import 'package:sptiy_grand/data/sources/auth/auth_firebase_service.dart';
import 'package:sptiy_grand/domain/repository/auth/auth.dart';
import 'package:sptiy_grand/service_locator.dart';

class AuthRepositeryImp extends AuthRepository {
  @override
  Future<void> signin() {
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signup(createUserReq);
  }
}
