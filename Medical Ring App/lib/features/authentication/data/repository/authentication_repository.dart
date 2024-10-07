import 'package:dartz/dartz.dart';
import 'package:medical_ring_app/core/error_handling/success.dart';
import 'package:medical_ring_app/features/authentication/data/data/remote_data_source.dart';

import '../../../../core/error_handling/Failure.dart';

class AuthenticationRepository {
  AuthenticationRemoteDataSource remoteDataSource =
      AuthenticationRemoteDataSource();

  Future<Either<Failure, Success>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    return await remoteDataSource.signInWithEmailAndPassword(email, password);
  }

  Future<Either<Failure, Success>> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    return await remoteDataSource.signUpWithEmailAndPassword(email, password);
  }
}
