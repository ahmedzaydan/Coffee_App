import 'package:caffeine_connect/core/data/user_model.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitState());

  static AuthCubit get(context) => BlocProvider.of(context);

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      emit(LoginLoadingState());

      // Login with email and password using FirebaseAuth
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(LoginSuccessState());
    } catch (error) {
      if (error is FirebaseAuthException) {
        // Handle user not found
        if (error.code == 'user-not-found') {
          emit(LoginErrorState(StringsManager.noUser));
        }

        // Handle wrong password
        else if (error.code == 'wrong-password') {
          emit(LoginErrorState(StringsManager.wrongPassword));
        }

        // Handle other FirebaseAuthException errors
        else {
          emit(LoginErrorState(StringsManager.loginFailed));
        }
      }

      // Handle if error is not FirebaseAuthException
      else if (error is Exception) {
        emit(LoginErrorState(StringsManager.loginFailed));
      }
    }
  }

  Future<void> register({
    required String username,
    required String mobileNumber,
    required String email,
    required String password,
  }) async {
    try {
      emit(RegisterLoadingState());

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

      emit(RegisterSuccessState());
    } catch (error) {
      if (error is FirebaseAuthException) {
        // Handle if user exists
        if (error.code == 'email-already-in-use') {
          emit(LoginErrorState(StringsManager.userAlreadyExists));
        }

        // Handle other FirebaseAuthException errors
        else {
          emit(LoginErrorState(StringsManager.registerFailed));
        }
      }

      // Handle if error is not FirebaseAuthException
      else if (error is Exception) {
        emit(LoginErrorState(StringsManager.registerFailed));
      }
    }
  }
}
