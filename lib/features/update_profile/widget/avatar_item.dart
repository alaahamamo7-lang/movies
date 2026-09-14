import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_assets.dart';

class AvatarItem extends StatelessWidget {
  final int index;
  final void Function(String) onAvatarSelect;
  static List<String> avatarList = [
    AppAssets.avatar1,
    AppAssets.avatar2,
    AppAssets.avatar3,
    AppAssets.avatar4,
    AppAssets.avatar5,
    AppAssets.avatar6,
    AppAssets.avatar7,
    AppAssets.avatar8,
    AppAssets.avatar9,
  ];
  AvatarItem({super.key, required this.index, required this.onAvatarSelect});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double sizeW = MediaQuery.sizeOf(context).width;
    double sizeH = MediaQuery.sizeOf(context).height;
    return Container(
      height: sizeH * 0.11,
      width: sizeW * 0.25,
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        border: Border.all(color: theme.colorScheme.primary, width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: GestureDetector(
        onTap: () {
          onAvatarSelect(avatarList[index]);
          Navigator.pop(context);
        },
        child: CircleAvatar(
          backgroundImage: AssetImage(avatarList[index]),
          radius: sizeW * 0.16,
        ),
      ),
    );
  }
}
