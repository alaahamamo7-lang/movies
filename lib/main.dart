import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_theme.dart';
import 'package:movies/features/auth/ui/screens/login_screen.dart';

void main() {
  runApp(Movies());
}

class Movies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      routes: {LoginScreen.routeName: (context) => LoginScreen()},
      initialRoute: LoginScreen.routeName,
    );
  }
}
