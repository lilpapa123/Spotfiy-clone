import 'package:dartz/dartz.dart';
import 'package:sptiy_grand/data/models/auth/create_user_req.dart';

abstract class AuthRepository {
  Future<Either> signup(CreateUserReq createUserReq);

  Future<void> signin();
}
