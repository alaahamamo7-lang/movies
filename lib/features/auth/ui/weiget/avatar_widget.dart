//

import 'package:movies/core/constants/app_assets.dart';

class AvatarWidget {
  final String imagePath;
  final String label;
  const AvatarWidget({
    this.imagePath = "assets/images/avatar_3.png",
    this.label = "avatar 1",
  });

  static List<AvatarWidget> avatars = [
    AvatarWidget(imagePath: AppAssets.avatar_1, label: "Avatar 1"),
    AvatarWidget(imagePath: AppAssets.avatar_2, label: "Avatar 2"),
    AvatarWidget(imagePath: AppAssets.avatar_3, label: "Avatar 3"),
  ];
}
