import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/constants/app_assets.dart';
import 'package:movies/core/constants/app_text.dart';
import 'package:movies/core/constants/app_theme.dart';
import 'package:movies/features/auth/ui/weigets/button/custom_text_button.dart';
import 'package:movies/features/auth/ui/weigets/button/custom_text_form_felid_button.dart';
import 'package:movies/features/auth/ui/weigets/button/main_button.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/loginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.sizeOf(context).height;
    double sizeW = MediaQuery.sizeOf(context).width;
    ThemeData theme = Theme.of(context);

    return Scaffold(
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
                      ),
                      SizedBox(height: size * 0.02),
                      CustomTextFormField(
                        hint: AppText.password,
                        icon: AppAssets.svgPassword,
                        suffixIcon: AppAssets.svgEyeOff,
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
                          ),
                        ],
                      ),
                      SizedBox(height: size * 0.02),
                      MainButton(
                        label: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                        buttonBg: theme.colorScheme.primary,
                        buttonFg: theme.colorScheme.secondary,
                        onPressed: () {},
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
                      MainButton(
                        onPressed: () {},
                        buttonBg: theme.colorScheme.primary,
                        buttonFg: theme.colorScheme.secondary,
                        label: Row(
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
