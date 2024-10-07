import 'package:dartz/dartz.dart';

import '../../../../core/error_handling/Failure.dart';
import '../../../../core/error_handling/success.dart';
import '../../../../core/services/firebase/firebase_repository.dart';

class AuthenticationRemoteDataSource {
  Future<Either<Failure, Success<dynamic>>> signUpWithEmailAndPassword(
      String email, String password) async {

    return await FirebaseRepository.signUpWithEmailAndPassword(
        email: email, password: password);
  }

  Future<Either<Failure, Success<dynamic>>> signInWithEmailAndPassword(
      String email, String password) async {
    return await FirebaseRepository.signInWithEmailAndPassword(
        email: email, password: password);
  }
}
