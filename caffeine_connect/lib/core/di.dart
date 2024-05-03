import 'package:caffeine_connect/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

var instance = GetIt.I;

Future<void> initAppModule() async {
  // App module is a module where we put all generic dependencies

  // AuthCubit instance
  instance.registerLazySingleton<AuthCubit>(() => AuthCubit());
}

void initLoginModule() {}

void initRegisterModule() {}
