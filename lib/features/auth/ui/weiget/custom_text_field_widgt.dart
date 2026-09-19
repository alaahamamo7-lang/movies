import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final String hintText;
  final String? lableText;
  final Icon? suffixIcon;
  final String prefixIcon;
  final bool isPassword;
  final int maxLines;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.textInputAction,
    this.validator,
    required this.hintText,
    this.lableText,
    this.suffixIcon,
    required this.prefixIcon,
    this.isPassword = false,
    this.maxLines = 1,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isShowPaasowrd = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 55,
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xff282A28),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        controller: widget.controller,
        maxLines: widget.maxLines,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        validator: widget.validator,
        decoration: InputDecoration(
          labelText: widget.lableText,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(widget.prefixIcon, width: 5, height: 5),
          ),
          hint: Text(widget.hintText, style: TextStyle(color: Colors.white)),
          suffixIcon: !widget.isPassword
              ? widget.suffixIcon
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isShowPaasowrd = !isShowPaasowrd;
                    });
                  },
                  icon: Icon(
                    isShowPaasowrd ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.white,
                  ),
                ),
          hoverColor: AppColors.white,
        ),
        obscureText: isShowPaasowrd,
        cursorColor: AppColors.white,
        style: TextStyle(color: AppColors.white),
      ),
    );
  }
}
