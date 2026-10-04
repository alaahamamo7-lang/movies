import 'package:flutter/material.dart';
import 'package:movies/core/app_colors.dart';
import 'package:movies/core/constants/app_color.dart';

class CardWidget extends StatelessWidget {
  final IconData icon;
  final double text;
  const CardWidget({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 4),
      decoration: BoxDecoration(
        color: AppColor.second,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColor.primary),
          const SizedBox(width: 8),
          Text('$text', style: TextStyle(color: AppColors.white)),
        ],
      ),
    );
  }
}
