import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_assets.dart';
import 'package:movies/core/constants/app_color.dart';
import 'package:movies/features/auth/ui/weiget/button/my_custom_text_form_feild.dart';
import 'package:movies/features/home/presentation/widgets/item_gridveiw.dart';

class SearchTab extends StatelessWidget {
  bool isLoeading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
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
              SizedBox(height: size.height * 0.01),
              isLoeading
                  ? Image.asset(AppAssets.placeholder)
                  : Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemBuilder: (context, index) => ItemGridveiw(),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
