import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_color.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Search", style: TextStyle(color: AppColor.white)),
    );
  }
}
