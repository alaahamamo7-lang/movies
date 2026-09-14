import 'package:flutter/material.dart';
import 'package:movies/features/update_profile/widget/avatar_item.dart';

class CustomBottomSheet extends StatelessWidget {
  final void Function(String) onAvatarSelect;
  CustomBottomSheet({super.key, required this.onAvatarSelect});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(19),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: GridView.builder(
        itemCount: AvatarItem.avatarList.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 18,
          mainAxisSpacing: 19,
        ),
        itemBuilder: (context, index) =>
            AvatarItem(index: index, onAvatarSelect: onAvatarSelect),
      ),
    );
  }
}
