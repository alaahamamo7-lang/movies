import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final Widget label;
  const CustomTextButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {}, child: label);
  }
}
