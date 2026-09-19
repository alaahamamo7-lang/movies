import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utilis/app_validators.dart';
import 'package:movies/features/auth/ui/viewModel/register_viewModel.dart';
import 'package:movies/features/auth/ui/weiget/change_language_widget.dart';
import 'package:movies/features/auth/ui/weiget/custom_text_field_widgt.dart';

import '../../../../core/utilis/app_assets.dart';
import '../weiget/avatar_card_widget.dart';
import '../weiget/avatar_widget.dart';

class RegisterScreen extends StatefulWidget {
  final AvatarWidget? avatar;

  const RegisterScreen({super.key, this.avatar});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121312),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: Color(0xffFFBB3B)),
        ),
        backgroundColor: Color(0xff121312),
        title: Text("Register", style: TextStyle(color: Color(0xffFFBB3B))),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<RegisterViewModel, RegisterStates>(
            bloc: RegisterViewModel(),
            builder: (context, state) => Form(
              key: formKey,
              child: Column(
                children: [
                  AvatarCardWidget(onAvatarSelected: (value) {}),
                  const SizedBox(height: 24),
                  CustomTextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    hintText: "name",
                    // suffixIcon: Icon(Icons.visibility),
                    prefixIcon: AppAssets.nameIcon,
                    isPassword: false,
                    controller: context
                        .read<RegisterViewModel>()
                        .userNameController,
                    validator: (name) =>
                        AppValidators.validateUserName(name: name),
                  ),
                  const SizedBox(height: 24),
                  CustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    hintText: "email",
                    // suffixIcon: Icon(Icons.visibility),
                    prefixIcon: AppAssets.emailIcon,
                    isPassword: false,
                    controller: context
                        .read<RegisterViewModel>()
                        .emailController,
                    validator: (email) =>
                        AppValidators.validateEmail(email: email),
                  ),
                  const SizedBox(height: 24),
                  CustomTextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    hintText: "password",
                    suffixIcon: Icon(Icons.visibility),
                    prefixIcon: AppAssets.passwordIcon,
                    isPassword: true,
                    controller: context
                        .read<RegisterViewModel>()
                        .passwordController,
                    validator: (password) =>
                        AppValidators.validatePassword(password: password),
                  ),
                  const SizedBox(height: 24),
                  CustomTextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    hintText: "confirm password",
                    suffixIcon: Icon(Icons.visibility),
                    prefixIcon: AppAssets.passwordIcon,
                    isPassword: true,
                    controller: context
                        .read<RegisterViewModel>()
                        .confirmPasswordController,
                    validator: (confirmPassword) =>
                        AppValidators.validateConfirmPassword(
                          confirmPassword: confirmPassword,
                        ),
                  ),
                  const SizedBox(height: 24),
                  CustomTextFormField(
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    hintText: "phone number",
                    // suffixIcon: Icon(Icons.visibility),
                    prefixIcon: AppAssets.phoneIcon,
                    isPassword: false,
                    validator: (phoneNumber) =>
                        AppValidators.validatePhoneNumber(phone: phoneNumber),
                  ),
                  const SizedBox(height: 24),
                  BlocBuilder<RegisterViewModel, RegisterStates>(
                    bloc: RegisterViewModel(),
                    builder: (context, state) => InkWell(
                      onTap: () {
                        state.isLoading ? RegisterViewModel().register() : null;
                      },
                      child: Container(
                        // width: MediaQuery.of(context).size.width * .7,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        padding: EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: Color(0xffF6BD00),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: state.isLoading
                              ? Text(
                                  "Create Account",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                )
                              : Center(
                                  child: const CircularProgressIndicator(),
                                ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have Account ?",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xffF6BD00),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ChangeLanguageWidget(onTap: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
