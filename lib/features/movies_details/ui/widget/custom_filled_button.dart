import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_color.dart';

class CustomFilledButton extends StatelessWidget {
  final Function() onTap;
  final String labelText;
  const CustomFilledButton({
    super.key,
    required this.onTap,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: AppColor.red,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            labelText,
            style: TextStyle(
              color: AppColor.white,
              fontSize: 20,
              fontWeight: .w700,
            ),
          ),
        ),
      ),
    );
  }
}
