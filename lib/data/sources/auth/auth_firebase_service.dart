import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sptiy_grand/data/models/auth/create_user_req.dart';
import 'package:sptiy_grand/data/models/auth/signin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserReq createUserReq);

  Future<Either> signin(SigninUserReq signinUserReq);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserReq.email,
        password: signinUserReq.password,
      );

      return Right("Sigin was Successful");
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == "inavlid-email") {
        message = "Not User found for that email ";
      } else if (e.code == "invalid-creadential") {
        message = "wrong password provided for that user";
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );

      return Right("SignUp was Successful");
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == "weak-password") {
        message = "the password you provided is too weak";
      } else if (e.code == "email-already-in-use") {
        message = "An account already exists for that email";
      }
      return Left(message);
    }
  }
}
