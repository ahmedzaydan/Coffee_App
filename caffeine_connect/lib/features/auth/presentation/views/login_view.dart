import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.all(ValuesManager.v30),
        child: SingleChildScrollView(
          child: LoginViewBody(),
        ),
      ),
    );
  }
}
