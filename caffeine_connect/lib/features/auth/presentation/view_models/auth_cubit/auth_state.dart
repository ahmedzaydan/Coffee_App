part of 'auth_cubit.dart';

class AuthState {}

class AuthInitState extends AuthState {}

// Login States
class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginErrorState extends AuthState {
  final String error;
  LoginErrorState(this.error);
}

// Logout States
class LogoutLoadingState extends AuthState {}

class LogoutSuccessState extends AuthState {}

class LogoutErrorState extends AuthState {
  final String error;
  LogoutErrorState(this.error);
}

// Register States
class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class RegisterErrorState extends AuthState {
  final String error;
  RegisterErrorState(this.error);
}
