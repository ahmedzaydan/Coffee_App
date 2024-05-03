import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

void navigateTo({
  required BuildContext context,
  required String dest,
  Object? extra,
  bool replace = false,
}) {
  replace == true
      ? GoRouter.of(context).pushReplacement(dest, extra: extra)
      : GoRouter.of(context).push(dest, extra: extra);
}

AppBar getCustomAppBar({
  required BuildContext context,
  String? title,
  List<Widget>? actions,
}) {
  return AppBar(
    elevation: ValuesManager.v0,
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      padding: EdgeInsets.zero,
      icon: const Icon(
        Icons.arrow_back,
        color: ColorManager.black1,
      ),
    ),
    title: Text(
      title ?? StringsManager.empty,
      style: Styles.textStyle16.copyWith(
        color: ColorManager.black1,
      ),
    ),
    centerTitle: true,
    actions: actions ??
        [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: ColorManager.secondary,
            ),
          ),
        ],
  );
}

String? validatedPassword(String password) {
  // (?=.*[A-Z])       // Should contain at least one upper case
  // (?=.*[a-z])       // Should contain at least one lower case
  // (?=.*?[0-9])      // Should contain at least one digit
  // (?=.*?[!@#\$&*~]) // Should contain at least one Special character
  // .{8,}             // Must be at least 8 characters in length
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  if (password.isEmpty) {
    return "Password should not be empty";
  } else if (regex.hasMatch(password)) {
    return null;
  } else {
    return "Password must be at lease 8 characters, \n"
        "1 uppercase, 1 lowercase, 1 digit\nand 1 special character.";
  }
}

String? validatedEmail(String email) {
  // [a-zA-Z0-9._%+-]+ // Username: one or more valid characters
  // @                 // The at symbol
  // [a-zA-Z0-9.-]+    // Domain: one or more valid characters
  // \.                // Dot before the top-level domain
  // [a-zA-Z]{2,}      // Top-level domain: two or more alphabetical characters

  RegExp regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  if (email.isEmpty) {
    return "Email should not be empty";
  } else if (regex.hasMatch(email)) {
    return null;
  } else {
    return "Invalid email address.";
  }
}

Color colorToast(ToastStates state) {
  Color color;
  if (state == ToastStates.SUCCESS) {
    color = Colors.green;
  } else if (state == ToastStates.ERROR) {
    color = Colors.red;
  } else {
    color = Colors.amber;
  }
  return color;
}

// custom showToast
void showCustomToast({
  required String message,
  required ToastStates state,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: colorToast(state),
    textColor: Colors.white,
    fontSize: ValuesManager.v18,
  );
}

void kprint(dynamic value) {
  if (kDebugMode) {
    print(value);
  }
}
