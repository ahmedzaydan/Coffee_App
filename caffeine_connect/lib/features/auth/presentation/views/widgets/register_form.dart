import 'package:caffeine_connect/core/utils/color_manager.dart';
import 'package:caffeine_connect/core/utils/constants.dart';
import 'package:caffeine_connect/core/utils/functions.dart';
import 'package:caffeine_connect/core/utils/strings_manager.dart';
import 'package:caffeine_connect/core/utils/styles.dart';
import 'package:caffeine_connect/core/utils/values_manager.dart';
import 'package:caffeine_connect/core/widgets/custom_material_button.dart';
import 'package:caffeine_connect/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/email.dart';
import 'package:caffeine_connect/features/auth/presentation/views/widgets/password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterErrorState) {
          showCustomToast(
            message: state.error,
            state: ToastStates.ERROR,
          );
        }
        if (state is RegisterSuccessState) {
          showCustomToast(
            message: StringsManager.success,
            state: ToastStates.SUCCESS,
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              // username
              CustomTextFormField(
                controller: _nameController,
                hintText: StringsManager.username,
                prefixIcon: const Icon(
                  Icons.person_rounded,
                  color: ColorManager.secondary,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Username should not be empty";
                  }
                  return null;
                },
              ),

              const SizedBox(height: ValuesManager.v10),

              // mobile number
              CustomTextFormField(
                controller: _mobileNumberController,
                keyboardType: TextInputType.phone,
                hintText: StringsManager.mobileNumber,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(11),
                ],
                prefixIcon: const Icon(
                  Icons.phone_android_rounded,
                  color: ColorManager.secondary,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Mobile number should not be empty";
                  } else if (value.length < 11) {
                    return "Mobile number should be 11 digits";
                  }
                  return null;
                },
              ),

              const SizedBox(height: ValuesManager.v10),
              Email(emailController: _emailController),
              const SizedBox(height: ValuesManager.v10),
              Password(passwordController: _passwordController),

              // Sign up button
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: ValuesManager.v20),
                child: CustomMaterialButton(
                  text: StringsManager.signUp,
                  textStyle: Styles.textStyle18.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      AuthCubit.get(context).register(
                        username: _nameController.text,
                        mobileNumber: _mobileNumberController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
