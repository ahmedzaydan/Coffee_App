import 'package:caffeine_connect/core/utils/assets_manager.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';

class SocialMediaAuth extends StatelessWidget {
  const SocialMediaAuth({
    super.key,
  });
  final double value = ValuesManager.v60;
  @override
  Widget build(BuildContext context) {
    final cubit = AuthCubit.get(context);
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
            onPressed: () async {
              await cubit.login(method: AuthMethod.google);
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
            onPressed: () async {
              await cubit.login(method: AuthMethod.facebook);
              // print(cubit.getLoginMethod());
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
