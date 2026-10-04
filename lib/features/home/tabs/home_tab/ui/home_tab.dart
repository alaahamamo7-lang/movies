import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_color.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("HomeTab", style: TextStyle(color: AppColor.white)),
    );
  }
}
