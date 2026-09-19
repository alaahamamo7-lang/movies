import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_theme.dart';
import 'package:movies/features/auth/ui/screens/login_screen.dart';
import 'package:movies/features/update_profile/ui/update_profile.dart';
import 'package:movies/features/ui/splash_screen.dart';
import 'package:movies/firebase_options.dart';

void main() async {
  debugPrint('main: start');
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint('main: binding ready');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  debugPrint('main: firebase ready');
  runApp(Movies());
  debugPrint('main: runApp called');
}

class Movies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      // home: const SplashScreen(),
      home: const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text(
            'hello',
            style: TextStyle(color: Colors.black, fontSize: 32),
          ),
        ),
      ),
    );
  }
}
