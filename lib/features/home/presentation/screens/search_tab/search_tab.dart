import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_assets.dart';
import 'package:movies/core/constants/app_color.dart';
import 'package:movies/features/auth/ui/weiget/button/my_custom_text_form_feild.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: .spaceBetween,
            children: [
              MyCustomTextFormField(
                hint: "search",
                prefixIcon: AppAssets.svgSearch,
              ),
              Spacer(),
              Image.asset(AppAssets.placeholder),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
