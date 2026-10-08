import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_color.dart';

class TabBarItem extends StatelessWidget {
  bool isSelected;
  TabBarItem({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColor.yellow : Colors.transparent,
        border: Border.all(color: AppColor.yellow, width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      height: 48,
      child: Text(
        "data",
        style: isSelected
            ? theme.textTheme.headlineLarge
            : theme.textTheme.headlineLarge!.copyWith(color: AppColor.yellow),
      ),
    );
  }
}
