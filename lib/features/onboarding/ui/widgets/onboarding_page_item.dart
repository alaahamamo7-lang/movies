import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_color.dart';
import 'package:movies/features/onboarding/model/onboarding_model_logic.dart';

class OnBoardingpage extends StatelessWidget {
  final OnBoardingScreenData data;

  OnBoardingpage({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.black,
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
