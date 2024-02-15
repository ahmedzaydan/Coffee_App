import 'package:caffeine_connect/core/data/user_model.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/error_handler.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  Future<AuthState> register({
    required String username,
    required String email,
    required String mobileNumber,
    required String password,
  });

  Future<AuthState> login({
    required String email,
    required String password,
  });

  Future<AuthState> logout();

  Future<AuthState> resetPassword({
    required String email,
  });
}

class AppAuthService implements AuthService {
  @override
  Future<AuthState> register({
    required String username,
    required String email,
    required String mobileNumber,
    required String password,
  }) async {
    try {
      // Create user credential
      var userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      var uid = userCredential.user!.uid;

      // Create user
      UserModel user = UserModel(
        uid: uid,
        username: username,
        mobileNumber: mobileNumber,
        email: email,
      );

      // Save user to firestore
      await Constants.usersCollection.doc(uid).set(user.toMap());

      return RegisterSuccessState();
    } catch (error) {
      return RegisterErrorState(ErrorHandler.handle(error).failure.message);
    }
  }

  @override
  Future<AuthState> login({
    required String email,
    required String password,
  }) async {
    try {
      // Login with email and password using FirebaseAuth
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return LoginSuccessState();
    } catch (error) {
      String message = ErrorHandler.handle(error).failure.message;
      if (message == StringsManager.defaultError) {
        message = StringsManager.loginFailed;
      }
      return LoginErrorState(message);
    }
  }

  @override
  Future<AuthState> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return LogoutSuccessState();
    } catch (error) {
      String message = ErrorHandler.handle(error).failure.message;
      if (message == StringsManager.defaultError) {
        message = StringsManager.logoutFailed;
      }
      return LogoutErrorState(message);
    }
  }

  @override
  Future<AuthState> resetPassword({
    required String email,
  }) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return ResetPasswordSuccessState(email);
    } catch (error) {
      return ResetPasswordErrorState(
          ErrorHandler.handle(error).failure.message);
    }
  }
}
