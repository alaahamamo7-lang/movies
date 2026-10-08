import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActiveNavBarItem extends StatelessWidget {
  final String iconName;

  const ActiveNavBarItem({super.key, required this.iconName});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SvgPicture.asset(
      iconName,
      colorFilter: ColorFilter.mode(theme.colorScheme.primary, .srcIn),
      fit: .scaleDown,
    );
  }
}
