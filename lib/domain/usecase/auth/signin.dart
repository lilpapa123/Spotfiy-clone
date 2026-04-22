import 'package:dartz/dartz.dart';
import 'package:sptiy_grand/core/configs/usecase/usecase.dart';

import 'package:sptiy_grand/data/models/auth/signin_user_req.dart';
import 'package:sptiy_grand/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';

class SigninCase implements Usecase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) async {
    return sl<AuthRepository>().signin(params!);
  }
}
