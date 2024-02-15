import 'package:caffeine_connect/core/data/failure.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ErrorHandler {
  late Failure failure;
  ErrorHandler.handle(dynamic error) {
    if (error is FirebaseException) {
      failure = _handleFirebaseException(error);
    } else {
      failure = _handleException(error);
    }
  }
}

Failure _handleFirebaseException(FirebaseException error) {
  switch (error.code) {
    case 'email-already-in-use':
      return Failure(message: StringsManager.userAlreadyExists);
    case 'user-not-found':
      return Failure(message: StringsManager.noUser);
    case 'wrong-password':
      return Failure(message: StringsManager.wrongPassword);
    default:
      return Failure(message: StringsManager.defaultError);
  }
}

Failure _handleException(dynamic error) {
  return Failure(message: StringsManager.defaultError);
}

