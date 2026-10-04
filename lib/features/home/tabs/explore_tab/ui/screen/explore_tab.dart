import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_color.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("ExploreTab", style: TextStyle(color: AppColor.white)),
    );
  }
}
