import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/constants/app_color.dart';
import 'package:movies/core/utilis/app_validators.dart';
import 'package:movies/features/auth/ui/cubit/forget_password_cubit.dart';
import 'package:movies/features/auth/ui/cubit/states/forget_password_state.dart';
import 'package:movies/features/auth/ui/screens/login_screen.dart';
import 'package:movies/features/auth/ui/weiget/custom_text_field_widgt.dart';

import '../../../../core/utilis/app_assets.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: Color(0xffFFBB3B)),
        ),
        backgroundColor: Color(0xff121312),
        title: Text(
          "Forget Password",
          style: TextStyle(color: Color(0xffFFBB3B)),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xff121312),
      body: BlocProvider(
        create: (context) => ForgotPasswordCubit(FirebaseAuth.instance),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SvgPicture.asset(AppAssets.forgetPasswordBanner),
              CustomTextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                hintText: "Enter your email",
                prefixIcon: AppAssets.emailIcon,
                validator: (email) => AppValidators.validateEmail(),
              ),
              const SizedBox(height: 24),
              BlocConsumer<ForgotPasswordCubit, ForgetPasswordState>(
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
                      const SnackBar(
                        content: Text(
                          'If an account exists, a reset link was sent.',
                          textAlign: TextAlign.center,
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
                  onTap: () {
                    if (formKey.currentState!.validate()) return;
                    context.read<ForgotPasswordCubit>().sendReset(
                      emailController.text,
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
                      child: Text(
                        "Verify Email",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
