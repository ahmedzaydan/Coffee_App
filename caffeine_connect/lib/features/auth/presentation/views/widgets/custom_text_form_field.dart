import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final Color? hintColor;
  final String? hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final void Function()? suffixOnPressed;
  final bool obsecureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextFormField({
    super.key,
    this.controller,
    this.hintColor,
    this.prefixIcon,
    this.hintText,
    this.suffixIcon,
    this.obsecureText = false,
    this.suffixOnPressed,
    this.keyboardType,
    this.validator,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      obscureText: obsecureText,
      inputFormatters: inputFormatters,
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
          maxWidth: ValuesManager.v60,
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
        padding: const EdgeInsets.all(ValuesManager.v8),
        child: SizedBox(
          width: ValuesManager.v50,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              const SizedBox(width: ValuesManager.v5),
              Container(
                width: ValuesManager.v2,
                height: ValuesManager.v20,
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
