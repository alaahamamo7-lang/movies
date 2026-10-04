import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movies/core/app_colors.dart';
import 'package:movies/features/home/domain/entities/movie.dart';

class HomeDynamicBackground extends StatelessWidget {
  final MovieEntity? movie;

  const HomeDynamicBackground({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    if (movie == null) return const SizedBox.shrink();

    final String imageUrl = movie!.backgroundImage ??
        movie!.largeCoverImage ??
        movie!.mediumCoverImage ??
        '';

    return Positioned.fill(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.65,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 600),
              child: Image.network(
                imageUrl,
                key: ValueKey<String>(movie!.id?.toString() ?? 'bg'),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                errorBuilder: (_, __, ___) => Container(
                  color: AppColors.black,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.black,
                    AppColors.black,
                    AppColors.black,
                    AppColors.black,
                  ],
                  stops: const [0.0, 0.45, 0.7, 1.0],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
              child: Container(
                color: AppColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}