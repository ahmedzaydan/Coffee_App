import 'package:caffeine_connect/core/data/user_model.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  Future<void> loginWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        emit(LoginErrorState(StringsManager.loginFailed));
      } else {
        // Obtain the auth details from the request
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // Sign in to Firebase with the Google credentials
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Once signed in, get the UserCredential
        final UserCredential authResult =
            await FirebaseAuth.instance.signInWithCredential(credential);

        final User user = authResult.user!;

        // Check if user exists in firestore
        var userDoc = await Constants.usersCollection.doc(user.uid).get();

        if (!userDoc.exists) {
          // Create user
          UserModel userModel = UserModel(
            uid: user.uid,
            username: user.displayName,
            mobileNumber: user.phoneNumber ?? "00000000000",
            email: user.email,
          );

          // Save user to firestore
          await Constants.usersCollection.doc(user.uid).set(userModel.toMap());
        }
        emit(LoginSuccessState());
      }
    } catch (error) {
      if (kDebugMode) {
        emit(LoginErrorState(StringsManager.loginFailed));
      }
    }
  }

  Future<void> loginWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.accessToken == null) {
        if (kDebugMode) {
          print("Login failed");
        }
        emit(LoginErrorState(StringsManager.loginFailed));
      } else {
        // Create a credential from the access token
        final AuthCredential credential =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);

        // Once signed in, get the UserCredential
        final UserCredential authResult =
            await FirebaseAuth.instance.signInWithCredential(credential);

        var user = authResult.user!;

        // Check if user exists in firestore
        var userDoc = await Constants.usersCollection.doc(user.uid).get();

        if (!userDoc.exists) {
          // Create user
          UserModel userModel = UserModel(
            uid: user.uid,
            username: user.displayName,
            mobileNumber: user.phoneNumber ?? "00000000000",
            email: user.email,
          );

          // Save user to firestore
          await Constants.usersCollection.doc(user.uid).set(userModel.toMap());
        }
        emit(LoginSuccessState());
      }
    } catch (error) {
      if (kDebugMode) {
        print("Error during Facebook Sign-In: $error");
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
