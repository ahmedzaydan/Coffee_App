import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/features/auth/presentation/view_models/app_auth_service.dart';
import 'package:caffeine_connect/features/auth/presentation/view_models/social_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitState());

  static AuthCubit get(context) => BlocProvider.of(context);
  AuthService appAuthService = AppAuthService();
  SocialAuthService googleAuthService = GoogleAuthService();
  SocialAuthService facebookAuthState = FacebookAuthService();

  Future<void> register({
    required String username,
    required String mobileNumber,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoadingState());
    AuthState state = await appAuthService.register(
      username: username,
      email: email,
      mobileNumber: mobileNumber,
      password: password,
    );
    emit(state);
  }

  Future<void> login({
    required AuthMethod method,
    String? email,
    String? password,
  }) async {
    emit(LoginLoadingState());
    late AuthState state;

    switch (method) {
      case AuthMethod.firebase:
        state = await appAuthService.login(
          email: email!,
          password: password!,
        );
        break;
      case AuthMethod.google:
        state = await googleAuthService.login();
        break;
      case AuthMethod.facebook:
        state = await facebookAuthState.login();
        break;
    }
    emit(state);
  }

  Future<void> logout({
    required AuthMethod method,
  }) async {
    emit(LogoutLoadingState());
    late AuthState state;

    switch (method) {
      case AuthMethod.firebase:
        state = await appAuthService.logout();
        break;
      case AuthMethod.google:
        state = await googleAuthService.logout();
        break;
      case AuthMethod.facebook:
        state = await facebookAuthState.logout();
        break;
    }
    emit(state);
  }

  String getLoginMethod() {
    var user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Check if the user is signed in with Google
      if (user.providerData.any(
        (userInfo) => userInfo.providerId == 'google.com',
      )) {
        return StringsManager.googleMethod;
      }

      // Check if the user is signed in with Facebook
      if (user.providerData.any(
        (userInfo) => userInfo.providerId == 'facebook.com',
      )) {
        return StringsManager.facebookMethod;
      }

      // Check if the user is signed in with Firebase Email/Password
      if (user.providerData.any(
        (userInfo) => userInfo.providerId == 'firebase',
      )) {
        return StringsManager.firebaseMethod;
      }
    }
    return StringsManager.userIsNotSignedIn;
  }

  Future<void> resetPassword({required String email}) async {
    emit(ResetPasswordLoadingState());
    AuthState state = await appAuthService.resetPassword(email: email);
    emit(state);
  }
}
