import 'package:caffeine_connect/core/utils/assets_manager.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';

class SocialMediaAuth extends StatelessWidget {
  const SocialMediaAuth({
    super.key,
    required this.cubit,
  });
  final double value = ValuesManager.v60;

  final AuthCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Google button
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(value / 2),
            ),
            minWidth: value,
            height: value,
            padding: EdgeInsets.zero,
            onPressed: () {
              cubit.loginWithGoogle();
            },
            child: Image.asset(
              AssetsManager.googleLogo,
              height: ValuesManager.v60,
              width: ValuesManager.v60,
            ),
          ),

          // Facebook button
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(value / 2),
            ),
            minWidth: value,
            height: value,
            padding: EdgeInsets.zero,
            onPressed: () {
              cubit.loginWithFacebook();
            },
            child: Image.asset(
              AssetsManager.facebookLogo,
              height: ValuesManager.v40,
              width: ValuesManager.v40,
            ),
          ),
        ],
      ),
    );
  }
}
