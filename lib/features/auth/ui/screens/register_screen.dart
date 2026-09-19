import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/constants/app_color.dart';
import 'package:movies/core/utilis/app_validators.dart';
import 'package:movies/features/auth/ui/cubit/register_cubit.dart';
import 'package:movies/features/auth/ui/cubit/states/register_state.dart';
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
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // bloc: RegisterViewModel(),
      create: (context) => RegisterCubit(FirebaseAuth.instance),
      child: Scaffold(
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
            child: Form(
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
                    controller: userNameController,
                    validator: (name) =>
                        AppValidators.validateUserName(name: name),
                  ),
                  const SizedBox(height: 24),
                  CustomTextFormField(
                    hintText: "email",
                    prefixIcon: AppAssets.emailIcon,
                    isPassword: false,
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    controller: emailController,
                    validator: (email) =>
                        AppValidators.validateEmail(email: email),
                  ),

                  const SizedBox(height: 24),
                  CustomTextFormField(
                    hintText: "password",
                    prefixIcon: AppAssets.passwordIcon,
                    isPassword: true,
                    maxLines: 1,
                    suffixIcon: Icon(Icons.visibility),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,

                    controller: passwordController,
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
                    controller: confirmPasswordController,
                    validator: (confirmPassword) =>
                        AppValidators.validateConfirmPassword(
                          confirmPassword: confirmPassword,
                          password: passwordController.text,
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
                    controller: phoneNumberController,
                  ),
                  const SizedBox(height: 24),
                  BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state.errorMessage != null &&
                          state.isLoading == false &&
                          state.isSuccess == false) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              state.errorMessage,
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: AppColor.red,
                            behavior: SnackBarBehavior.floating,
                            width: 300,
                          ),
                        );
                      }
                      if (state.isSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              textAlign: TextAlign.center,
                              "Account Created Successfully",
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: AppColor.green,
                            behavior: SnackBarBehavior.floating,
                            width: 300,
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    builder: (context, state) => InkWell(
                      onTap: state.isLoading
                          ? null
                          : () {
                              if (!formKey.currentState!.validate()) return;
                              context.read<RegisterCubit>().register(
                                context,
                                email: emailController.text.trim(),
                                password: passwordController.text,
                              );
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
                              ? Center(
                                  child: const CircularProgressIndicator(
                                    color: AppColor.white,
                                  ),
                                )
                              : Text(
                                  "Create Account",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
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
