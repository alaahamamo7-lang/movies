import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/constants/app_assets.dart';

class MainButton extends StatelessWidget {
  final Widget label;
  final Color buttonBg;
  final Color buttonFg;
  final void Function()? onPressed;
  final Widget? icon;
  const MainButton({
    super.key,
    required this.label,
    required this.buttonBg,
    required this.buttonFg,
    this.onPressed,
    this.icon,
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
        child: icon == null
            ? Center(child: label)
            : Center(
                child: Row(
                  mainAxisAlignment: .center,
                  children: [label, icon!],
                ),
              ),
      ),
    );
  }
}
