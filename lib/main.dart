import 'package:flutter/material.dart';
import 'package:movies/modules/auth/screens/forget_password_screen.dart';
import 'package:movies/modules/auth/screens/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      home: const ForgetPasswordScreen(),
    );
  }
}
