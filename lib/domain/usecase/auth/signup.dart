import 'package:dartz/dartz.dart';
import 'package:sptiy_grand/core/configs/usecase/usecase.dart';
import 'package:sptiy_grand/data/models/auth/create_user_req.dart';
import 'package:sptiy_grand/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';

class SignupCase implements Usecase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) async {
    return sl<AuthRepository>().signup(params!);
  }
}
