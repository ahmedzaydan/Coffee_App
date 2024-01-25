import 'package:caffeine_connect/app.dart';
import 'package:caffeine_connect/bloc_observer.dart';
import 'package:caffeine_connect/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = MyBlocObserver();

  runApp(const CaffeineConnect());
}
