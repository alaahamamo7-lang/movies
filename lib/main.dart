import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies/core/constants/app_theme.dart';

import 'package:movies/features/onboarding/ui/screen/onboarding_screen.dart';

import 'package:movies/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GoogleSignIn.instance.initialize(
    serverClientId:
        '234065139777-4p46uuhtp1tit8ats3no0ban24ltov7p.apps.googleusercontent.com',
  );
  runApp(Movies());
}

class Movies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,

      home: const OnBoardingScreen(),
    );
  }
}
