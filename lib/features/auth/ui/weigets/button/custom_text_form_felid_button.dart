import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final String icon;
  String? suffixIcon;
  CustomTextFormField({
    super.key,
    required this.hint,
    required this.icon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    ThemeData theme = Theme.of(context);
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: suffixIcon == null
            ? null
            : SvgPicture.asset(
                suffixIcon!,
                colorFilter: ColorFilter.mode(
                  theme.colorScheme.onSurfaceVariant,
                  BlendMode.srcIn,
                ),
                fit: .scaleDown,
                height: size.height * 0.026,
              ),
        prefixIcon: SvgPicture.asset(
          colorFilter: ColorFilter.mode(
            theme.colorScheme.onSurfaceVariant,
            BlendMode.srcIn,
          ),
          icon,
          fit: .scaleDown,
          height: size.height * 0.026,
        ),
        hintText: hint,
        hintStyle: theme.textTheme.displayMedium,
        fillColor: theme.colorScheme.secondary,
        filled: true,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: theme.colorScheme.secondary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: theme.colorScheme.secondary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
