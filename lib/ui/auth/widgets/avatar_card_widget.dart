import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/ui/auth/widgets/avatar_widget.dart';

class AvatarCardWidget extends StatefulWidget {
  final ValueChanged<AvatarWidget> onAvatarSelected;

  const AvatarCardWidget({super.key, required this.onAvatarSelected});

  @override
  State<AvatarCardWidget> createState() => _AvatarCardWidgetState();
}

class _AvatarCardWidgetState extends State<AvatarCardWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: AvatarWidget.avatars.length,
      itemBuilder: (context, index, realIndex) {
        final avatarData = AvatarWidget.avatars[index];
        return GestureDetector(
          onTap: () {
            setState(() => _selectedIndex = index);
            widget.onAvatarSelected(avatarData);
          },
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  avatarData.imagePath,
                  width: 80,
                  height: 80,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error, size: 80, color: Colors.red),
                ),
                const SizedBox(height: 4),
                Text(
                  avatarData.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 176,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
        viewportFraction: 0.3,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        autoPlay: true,
        padEnds: true,
        onPageChanged: (index, reason) {
          setState(() => _selectedIndex = index);
          widget.onAvatarSelected(AvatarWidget.avatars[index]);
        },
      ),
    );
  }
}
