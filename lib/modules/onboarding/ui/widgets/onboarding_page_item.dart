import 'package:flutter/material.dart';
import 'package:movies/modules/onboarding/controller/onboarding_model_logic.dart';
import 'package:movies/core/app_colors.dart';

class OnBoardingpage extends StatelessWidget {
  final OnBoardingScreenData data;

  OnBoardingpage({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black,
      child: Image.asset(
        data.imagePath,
        fit: BoxFit.contain,
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.topCenter,
      ),
    );
  }
}