import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final Color? hintColor;
  final String? hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final void Function()? suffixOnPressed;
  final bool obsecureText;
  final TextInputType? keyboardType;
  const CustomTextFormField({
    super.key,
    this.controller,
    this.hintColor,
    this.prefixIcon,
    this.hintText,
    this.suffixIcon,
    this.obsecureText = false,
    this.suffixOnPressed, this.keyboardType, 
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obsecureText,
      decoration: InputDecoration(
        disabledBorder: decorateBorder(),
        enabledBorder: decorateBorder(),
        focusedBorder: decorateBorder(),
        hintText: hintText,
        hintStyle: Styles.textStyle12.copyWith(
          color: hintColor ?? ColorManager.grey4,
        ),
        prefixIcon:
            prefixIcon != null ? CustomPrefixIcon(icon: prefixIcon!) : null,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 0,
          maxWidth: AppValues.v60,
          minHeight: 0,
        ),
        suffixIcon: suffixIcon != null
            ? PasswordVisibiltyIcon(
                icon: suffixIcon!,
                onPressed: suffixOnPressed,
              )
            : null,
      ),
    );
  }
}

UnderlineInputBorder decorateBorder() {
  return const UnderlineInputBorder(
    borderSide: BorderSide(color: ColorManager.grey4),
  );
}

class CustomPrefixIcon extends StatelessWidget {
  final Icon icon;
  const CustomPrefixIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(AppValues.v8),
        child: SizedBox(
          width: AppValues.v50,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              const SizedBox(width: AppValues.v5),
              Container(
                width: AppValues.v2,
                height: AppValues.v20,
                color: ColorManager.grey4,
              ),
            ],
          ),
        ));
  }
}

class PasswordVisibiltyIcon extends StatelessWidget {
  final Icon icon;
  final void Function()? onPressed;
  const PasswordVisibiltyIcon({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      color: ColorManager.black1,
    );
  }
}
