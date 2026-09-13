import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/utilis/app_validators.dart';
import 'package:movies/modules/auth/widgets/custom_text_field_widgt.dart';
import 'package:movies/modules/login/login_screen.dart';

import '../../../core/utilis/app_assets.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
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
      body: Form(
        key: formKey,
        child: Column(
          children: [
            SvgPicture.asset(AppAssets.forgetPasswordBanner),
            CustomTextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              hintText: "Enter your email",
              prefixIcon: AppAssets.emailIcon,
              validator: (email) => AppValidators.validateEmail(),
            ),
            const SizedBox(height: 24),
            InkWell(
              onTap: () {
                if (formKey.currentState!.validate()) {}
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
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
          ],
        ),
      ),
    );
  }
}
