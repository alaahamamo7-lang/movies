import 'package:flutter/material.dart';
import 'package:movies/features/auth/ui/screens/forget_password_screen.dart';
import 'package:movies/features/auth/ui/screens/login_screen.dart';
import 'package:movies/features/auth/ui/screens/register_screen.dart';
import 'package:movies/features/home/presentation/screens/home_screen.dart';
import 'package:movies/features/home/presentation/screens/movie_screen_details.dart';
import 'package:movies/features/home/presentation/screens/see_more_screen.dart';
import 'package:movies/features/update_profile/ui/update_profile.dart';

abstract final class AppRoutes {
  static MaterialPageRoute loginScreen() =>
      MaterialPageRoute(builder: (context) => LoginScreen());
  static MaterialPageRoute registerScreen() =>
      MaterialPageRoute(builder: (context) => RegisterScreen());
  static MaterialPageRoute forgetPasswordScreen() =>
      MaterialPageRoute(builder: (context) => ForgetPasswordScreen());
  static MaterialPageRoute updateProfileScreen() =>
      MaterialPageRoute(builder: (context) => UpdateProfileScreen());
  static MaterialPageRoute homeScreen() =>
      MaterialPageRoute(builder: (context) => HomeScreen());
  static MaterialPageRoute seeMoreScreen(String genre) =>
      MaterialPageRoute(builder: (context) => SeeMoreScreen(genre: genre),);
  static MaterialPageRoute movieDetailsScreen() =>
      MaterialPageRoute(builder: (context) => MovieDetailsScreen());
}
