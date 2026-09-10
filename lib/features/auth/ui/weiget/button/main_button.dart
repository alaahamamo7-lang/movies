import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final Widget label;
  final Color buttonBg;
  final Color buttonFg;
  final void Function()? onPressed;
  const MainButton({
    super.key,
    required this.label,
    required this.buttonBg,
    required this.buttonFg,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Center(
      child: CupertinoButton(
        color: buttonBg,
        foregroundColor: buttonFg,
        borderRadius: BorderRadius.circular(16),
        onPressed: onPressed,
        child: Center(child: label),
      ),
    );
  }
}
