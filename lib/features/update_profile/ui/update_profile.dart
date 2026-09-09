import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_assets.dart';
import 'package:movies/core/constants/app_text.dart';

class UpdateProfileScreen extends StatelessWidget {
  static const String routeName = "/updateProfile";
  String selectedAvatar = AppAssets.avatar1;
  List<String> avatarList = [
    AppAssets.avatar1,
    AppAssets.avatar2,
    AppAssets.avatar3,
    AppAssets.avatar4,
    AppAssets.avatar5,
    AppAssets.avatar6,
    AppAssets.avatar8,
    AppAssets.avatar9,
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double sizeW = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, color: theme.colorScheme.primary),
        title: Text(
          AppText.pickAvatar,
          style: theme.textTheme.displayMedium!.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage(selectedAvatar),
              radius: sizeW * 0.16,
            ),
          ),
        ],
      ),
    );
  }
}
