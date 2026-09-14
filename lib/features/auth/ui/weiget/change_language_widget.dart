import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/utilis/app_assets.dart';

class ChangeLanguageWidget extends StatefulWidget {
  final Function() onTap;

  const ChangeLanguageWidget({super.key, required this.onTap});

  @override
  State<ChangeLanguageWidget> createState() => _ChangeLanguageWidgetState();
}

class _ChangeLanguageWidgetState extends State<ChangeLanguageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 95,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffF6BD00)),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: widget.onTap,
            child: SvgPicture.asset(AppAssets.englishIcon, height: 40),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: widget.onTap,
            child: SvgPicture.asset(AppAssets.egyptIcon, height: 40),
          ),
        ],
      ),
    );
  }
}
