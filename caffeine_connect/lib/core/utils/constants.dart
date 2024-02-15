import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Constants {
  static const String poppins = 'Poppins';
  static const String dmSans = 'DMSans';
  static const String reenieBeanie = 'ReenieBeanie';

  static const int splashScreenDelayInSeconds = 3;
  static const int welceomScreenDelayInSeconds = 6;
  static int textAnimationDuration = 3;

  static const int zero = 0;
  static const double buttonRadius = 25;
  static const int codeLength = 4;

  static var usersCollection = FirebaseFirestore.instance.collection('users');
}

// ignore: constant_identifier_names
enum ToastStates { SUCCESS, ERROR, WARNING }

enum AuthMethod { google, facebook, firebase }
