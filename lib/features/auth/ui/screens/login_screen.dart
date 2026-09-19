import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/constants/app_assets.dart';
import 'package:movies/core/constants/app_color.dart';
import 'package:movies/core/constants/app_text.dart';
import 'package:movies/core/constants/app_theme.dart';
import 'package:movies/core/constants/routes/app_routes.dart';
import 'package:movies/core/utilis/app_validators.dart';
import 'package:movies/features/auth/ui/cubit/login_cubit.dart';
import 'package:movies/features/auth/ui/cubit/states/login_state.dart';
import 'package:movies/features/auth/ui/weiget/button/custom_text_button.dart';
import 'package:movies/features/auth/ui/weiget/button/custom_text_form_felid_button.dart';
import 'package:movies/features/auth/ui/weiget/button/main_button.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/loginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.sizeOf(context).height;
    double sizeW = MediaQuery.sizeOf(context).width;
    ThemeData theme = Theme.of(context);

    return BlocProvider(
      create: (context) => LoginCubit(FirebaseAuth.instance),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Center(
                    child: Image.asset(
                      AppAssets.logo,
                      height: size * 0.12,
                      fit: .fill,
                    ),
                  ),
                  SizedBox(height: size * 0.07),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          hint: AppText.email,
                          icon: AppAssets.svgEmail,
                          controller: emailController,
                          validator: (email) =>
                              AppValidators.validateEmail(email: email),
                          // controller: emailController,
                        ),
                        SizedBox(height: size * 0.02),
                        CustomTextFormField(
                          hint: AppText.password,
                          icon: AppAssets.svgPassword,
                          suffixIcon: AppAssets.svgEyeOff,
                          controller: passwordController,
                          validator: (password) =>
                              AppValidators.validatePassword(
                                password: password,
                              ),
                          // controller: passwordController,
                        ),
                        SizedBox(height: size * 0.001),
                        Row(
                          mainAxisAlignment: .end,
                          children: [
                            CustomTextButton(
                              label: Text(
                                AppText.forgetPassword,
                                style: theme.textTheme.displaySmall,
                              ),
                              onTap: () => Navigator.push(
                                context,
                                AppRoutes.forgetPasswordScreen(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size * 0.02),
                        BlocConsumer<LoginCubit, LoginState>(
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
                                    "Success",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: AppColor.green,
                                  behavior: SnackBarBehavior.floating,
                                  width: 300,
                                ),
                              );
                              // Navigator.pushReplacement(context, )
                            }
                          },
                          builder: (context, state) {
                            return MainButton(
                              label: state.isLoading
                                  ? Center(
                                      child: const CircularProgressIndicator(
                                        color: AppColor.white,
                                      ),
                                    )
                                  : Text(
                                      "Login",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: theme.colorScheme.secondary,
                                      ),
                                    ),
                              buttonBg: theme.colorScheme.primary,
                              buttonFg: theme.colorScheme.secondary,
                              onPressed: state.isLoading
                                  ? null
                                  : () {
                                      debugPrint("1 Tapped");
                                      if (!_formKey.currentState!.validate())
                                        return;
                                      debugPrint("Validated");
                                      context.read<LoginCubit>().login(
                                        email: emailController.text.trim(),
                                        password: passwordController.text,
                                      );
                                    },
                            );
                          },
                        ),
                        SizedBox(height: size * 0.02),
                        Row(
                          mainAxisAlignment: .center,
                          children: [
                            Text(
                              AppText.noAccount,
                              style: theme.textTheme.labelSmall!.copyWith(
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                            CustomTextButton(
                              label: Text(
                                "Create One",
                                style: theme.textTheme.displaySmall,
                              ),
                              onTap: () => Navigator.push(
                                context,
                                AppRoutes.registerScreen(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size * 0.02),
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Expanded(
                              child: Divider(
                                indent: sizeW * 0.04,
                                endIndent: sizeW * 0.04,
                                color: theme.colorScheme.primary,
                                thickness: 1,
                              ),
                            ),
                            Text(
                              "OR",
                              style: theme.textTheme.bodyMedium!.copyWith(
                                color: theme.colorScheme.primary,
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                indent: sizeW * 0.04,
                                endIndent: sizeW * 0.04,
                                color: theme.colorScheme.primary,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size * 0.04),
                        BlocConsumer<LoginCubit, LoginState>(
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
                                    "Success",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: AppColor.green,
                                  behavior: SnackBarBehavior.floating,
                                  width: 300,
                                ),
                              );
                              // Navigator.pushReplacement(context, )
                            }
                          },
                          builder: (context, state) => MainButton(
                            onPressed: state.isLoading
                                ? null
                                : () {
                                    context
                                        .read<LoginCubit>()
                                        .LoginWithGoogle();
                                  },

                            buttonBg: theme.colorScheme.primary,
                            buttonFg: theme.colorScheme.secondary,
                            label: state.isLoading
                                ? Center(
                                    child: const CircularProgressIndicator(),
                                  )
                                : Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        AppAssets.svgGoogle,
                                        fit: BoxFit.scaleDown,
                                        colorFilter: ColorFilter.mode(
                                          theme.colorScheme.secondary,
                                          BlendMode.srcIn,
                                        ),
                                        height: 24,
                                        width: 24,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        "Login with Google",
                                        style: theme.textTheme.titleMedium,
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
