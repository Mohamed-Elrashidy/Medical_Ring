
import 'firebase_failure.dart';

class ErrorHandler {

  static FirebaseFailure handleFirebaseError(dynamic error) {
    if (error.toString().contains('email-already-in-use')) {
      return FirebaseFailure(errorMessage: 'Email already in use');
    } else if (error.toString().contains('user-not-found')) {
      return FirebaseFailure(errorMessage: 'User not found');
    } else if (error.toString().contains('wrong-password')) {
      return FirebaseFailure(errorMessage: 'Wrong password');
    } else if (error.toString().contains('invalid-email')) {
      return FirebaseFailure(errorMessage: 'Invalid email');
    } else {
      return FirebaseFailure(errorMessage: 'Unknown error');
    }
  }

}
