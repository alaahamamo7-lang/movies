import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_assets.dart';

class ItemGridveiw extends StatelessWidget {
  const ItemGridveiw({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/onboarding_3.png"),
          fit: .fill,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
