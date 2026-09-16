import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBarItem extends StatelessWidget {
  final String iconName;

  const NavBarItem({super.key, required this.iconName});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SvgPicture.asset(
      iconName,
      colorFilter: ColorFilter.mode(theme.colorScheme.onSurfaceVariant, .srcIn),
      fit: .scaleDown,
    );
  }
}
