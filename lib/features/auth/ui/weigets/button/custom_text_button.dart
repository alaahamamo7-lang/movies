import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String label;
  const CustomTextButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return TextButton(
      onPressed: () {},
      child: Text(label, textAlign: .end, style: theme.textTheme.displaySmall),
    );
  }
}
