import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utilis/app_assets.dart';
import '../widgets/avatar_card_widget.dart';
import '../widgets/avatar_widget.dart';

class RegisterScreen extends StatelessWidget {
  final AvatarWidget? avatar;

  const RegisterScreen({super.key, this.avatar});

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
        child: Column(
          children: [
            // const SizedBox(height: 14),
            // CarouselSlider.builder(
            //   itemCount: AvatarWidget.avatars.length,
            //   itemBuilder: (context, index, realIndex) {
            //     return AvatarCardWidget(avatar: AvatarWidget.avatars[index]);
            //   },
            //   options: CarouselOptions(
            //     height: 160,
            //     enlargeStrategy: CenterPageEnlargeStrategy.scale,
            //     disableCenter: false,
            //     reverse: true,
            //     viewportFraction: 0.3,
            //     enlargeCenterPage: true,
            //     enableInfiniteScroll: true,
            //     autoPlay: true,
            //     padEnds: true,
            //   ),
            // ),
            AvatarCardWidget(onAvatarSelected: (value) {}),
            const SizedBox(height: 24),
            Container(
              height: 55,
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
                      Center(child: SvgPicture.asset(AppAssets.nameIcon)),
                      const SizedBox(width: 8),
                      Text("Name", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              height: 55,
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
                      Center(child: SvgPicture.asset(AppAssets.emailIcon)),
                      const SizedBox(width: 8),
                      Text("Email", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              height: 55,
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
                      Center(child: SvgPicture.asset(AppAssets.passwordIcon)),
                      // Icon(Icons.lock, color: Colors.white),
                      const SizedBox(width: 8),
                      Text("Password", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  suffixIcon: Icon(Icons.remove_red_eye, color: Colors.white),
                  // prefixIcon: Icon(Icons.abc),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              height: 55,
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
                      Center(child: SvgPicture.asset(AppAssets.passwordIcon)),
                      // Icon(Icons.lock, color: Colors.white),
                      const SizedBox(width: 8),
                      Text(
                        "Confirm Password",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  suffixIcon: Icon(Icons.remove_red_eye, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              height: 55,
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xff282A28),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hint: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(child: SvgPicture.asset(AppAssets.phoneIcon)),
                      const SizedBox(width: 8),
                      Text(
                        "Phone Number",
                        style: TextStyle(color: Colors.white),
                      ),
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
                    "Create Account",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have Account ?",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(width: 8),
                Text(
                  "Login",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Color(0xffF6BD00),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              height: 50,
              width: 95,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffF6BD00)),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: SvgPicture.asset(AppAssets.englishIcon, height: 40),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    child: SvgPicture.asset(AppAssets.egyptIcon, height: 40),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
