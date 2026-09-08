import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movies/core/app_colors.dart';
import 'package:movies/modules/onboarding/ui/screen//onboarding_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnBoardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/intro_icon.png',
                width: 253,
                height: 253,
              ),
            ),
            Positioned(
              bottom: 5,
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  Image.asset(
                    'assets/routegold_splash.png',
                    width: 200,
                    height:180,
                    fit: BoxFit.contain,
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
