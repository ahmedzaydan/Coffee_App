import 'package:caffeine_connect/core/data/user_model.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class SocialAuthService {
  Future<AuthState> login();
  Future<AuthState> logout();
}

class GoogleAuthService implements SocialAuthService {
  @override
  Future<AuthState> login() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return (LoginErrorState(StringsManager.loginFailed));
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
            mobileNumber:
                user.phoneNumber ?? StringsManager.defalutMobileNumber,
            email: user.email,
          );

          // Save user to firestore
          await Constants.usersCollection.doc(user.uid).set(userModel.toMap());
        }

        kprint("Google Sign-In Successful");
        kprint("User: $user");

        return LoginSuccessState();
      }
    } catch (error) {
      return LoginErrorState(StringsManager.loginFailed);
    }
  }

  @override
  Future<AuthState> logout() async {
    try {
      await GoogleSignIn().signOut();

      return LogoutSuccessState();
    } catch (error) {
      return LogoutErrorState(StringsManager.logoutFailed);
    }
  }
}

class FacebookAuthService implements SocialAuthService {
  @override
  Future<AuthState> login() async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, get the user credential
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);

      final User? user = userCredential.user;

      if (user == null) {
        return LoginErrorState(StringsManager.loginFailed);
      } else {
        kprint("Facebook Sign-In Successful");
        kprint("User: $user");

        // Check if user exists in firestore
        var userDoc = await Constants.usersCollection.doc(user.uid).get();

        if (!userDoc.exists) {
          kprint("User does not exist in firestore");

          // Create user
          UserModel userModel = UserModel(
            uid: user.uid,
            username: user.displayName,
            mobileNumber:
                user.phoneNumber ?? StringsManager.defalutMobileNumber,
            email: user.email,
          );

          // Save user to firestore
          await Constants.usersCollection.doc(user.uid).set(userModel.toMap());
        }
        return LoginSuccessState();
      }
    } catch (error) {
      kprint("Error during Facebook Sign-In: $error");
      return LoginErrorState(StringsManager.loginFailed);
    }
  }

  @override
  Future<AuthState> logout() async {
    try {
      await FacebookAuth.instance.logOut();
      return LogoutSuccessState();
    } catch (error) {
      return LogoutErrorState(StringsManager.logoutFailed);
    }
  }
}
