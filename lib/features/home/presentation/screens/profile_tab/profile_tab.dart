import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_assets.dart';
import 'package:movies/core/constants/app_color.dart';
import 'package:movies/features/home/presentation/widgets/profile_header.dart';

class ProfileTab extends StatelessWidget {
  ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    ThemeData theme = Theme.of(context);
    return Scaffold(body: Column(children: [ProfileHeader()]));
  }
}
