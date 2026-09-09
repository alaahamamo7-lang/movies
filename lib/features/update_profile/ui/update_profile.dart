import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_text.dart';

class UpdateProfileScreen extends StatelessWidget {
  static const String routeName = "/updateProfile";

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
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
      body: Column(children: [CircleAvatar()]),
    );
  }
}
