import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/constants/app_color.dart';

class MyCustomTextFormField extends StatelessWidget {
  final String hint;
  final String prefixIcon;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final String? suffixIcon;
  MyCustomTextFormField({
    super.key,
    required this.hint,
    required this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    ThemeData theme = Theme.of(context);
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hoverColor: AppColor.white,
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
          prefixIcon,
          colorFilter: ColorFilter.mode(
            theme.colorScheme.onSurfaceVariant,
            BlendMode.srcIn,
          ),
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
