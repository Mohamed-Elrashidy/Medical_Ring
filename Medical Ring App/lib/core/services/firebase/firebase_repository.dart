import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medical_ring_app/core/error_handling/Failure.dart';
import 'package:medical_ring_app/core/error_handling/error_handler.dart';
import 'package:medical_ring_app/core/error_handling/firebase_failure.dart';
import 'package:medical_ring_app/core/error_handling/success.dart';

class FirebaseRepository {
 static  Future<Either<Failure, Success>> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    Either<FirebaseFailure, Success> result;
    print("entred sign up");
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      result = Right(Success<UserCredential>(returnedData: userCredential));
      print("user created");
    } catch (e) {
      print("error ${e.toString()}");
      result = Left(ErrorHandler.handleFirebaseError(e));
    }
    return result;
  }

 static Future<Either<Failure, Success>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
   print("entred sign in");
    Either<FirebaseFailure, Success> result;
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print("user signed in");
      result = Right(Success<UserCredential>(returnedData: userCredential));
    } catch (e) {
      print("error ${e.toString()}");
      result = Left(ErrorHandler.handleFirebaseError(e));
    }
    return result;
  }
}
