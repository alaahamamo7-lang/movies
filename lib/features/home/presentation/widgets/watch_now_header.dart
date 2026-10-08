import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_color.dart';

class WatchNowHeader extends StatelessWidget {
  const WatchNowHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Center(
        child: Text(
          'Watch Now',
          style: TextStyle(
            color: AppColor.white,
            fontSize: 38,
            fontWeight: FontWeight.w800,
            fontStyle: FontStyle.italic,
            letterSpacing: 1.5,
            shadows: [
              Shadow(
                color: AppColor.black,
                offset: const Offset(0, 3),
                blurRadius: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
