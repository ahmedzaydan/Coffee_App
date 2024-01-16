import 'package:caffeine_connect/core/data/user_model.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
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

      FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(LoginSuccessState());
    } catch (error) {
      emit(LoginErrorState(error.toString()));
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

      // create user credential
      var userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      var uid = userCredential.user!.uid;

      // create user
      UserModel user = UserModel(
        uid: uid,
        username: username,
        mobileNumber: mobileNumber,
        email: email,
        password: password,
      );

      // save user to firestore
      await Constants.usersCollection.doc(uid).set(user.toMap());

      emit(RegisterSuccessState());
    } catch (error) {
      emit(RegisterErrorState(error.toString()));
    }
  }
}
