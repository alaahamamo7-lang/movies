import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final Widget label;
  final Function()? onTap;
  const CustomTextButton({super.key, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onTap, child: label);
  }
}
