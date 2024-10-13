import 'package:dartz/dartz.dart';
import 'package:medical_ring_app/core/error_handling/success.dart';
import 'package:medical_ring_app/features/authentication/data/data/remote_data_source.dart';
import 'package:medical_ring_app/features/account/data/model/account_model.dart';

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

  createAccount(
      {required String userId,
      required String email,
      required String name,
      required String phoneNumber}) async {
    UserAccountModel userAccountModel = UserAccountModel(
        name: name,
        email: email,
        userId: userId,
        phoneNumber: phoneNumber,
        ringsIds: []);

    return await remoteDataSource.createAccount(
        userId: userId, userAccountModel: userAccountModel);

  }
}
