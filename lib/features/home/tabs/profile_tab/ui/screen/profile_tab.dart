import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_color.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Profile", style: TextStyle(color: AppColor.white)),
    );
  }
}
