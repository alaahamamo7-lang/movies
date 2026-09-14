import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utilis/app_assets.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          SvgPicture.asset(AppAssets.forgetPasswordBanner),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xff282A28),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              decoration: InputDecoration(
                hint: Row(
                  children: [
                    SvgPicture.asset(AppAssets.emailIcon),
                    const SizedBox(width: 8),
                    Text("Email", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          InkWell(
            onTap: () {},
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
    );
  }
}
