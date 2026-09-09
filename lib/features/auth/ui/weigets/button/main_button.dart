import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final Widget label;
  final void Function()? onPressed;
  const MainButton({super.key, required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Center(
      child: CupertinoButton(
        color: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(16),
        onPressed: onPressed,
        child: Center(child: label),
      ),
    );
  }
}
