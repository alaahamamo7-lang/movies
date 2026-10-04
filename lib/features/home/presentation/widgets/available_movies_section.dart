import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/app_colors.dart';
import 'package:movies/features/home/domain/entities/movie.dart';
import 'package:movies/features/home/presentation/widgets/movie_card.dart';

class AvailableMoviesSection extends StatelessWidget {
  final List<MovieEntity> movies;
  final Function(int index) onPageChanged;

  const AvailableMoviesSection({
    super.key,
    required this.movies,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        const SizedBox(height: 12),
        Center(
          child: Text(
            'Available Now',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 32,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
              letterSpacing: 1.2,
              shadows: [
                Shadow(
                  color: AppColors.black,
                  offset: const Offset(0, 3),
                  blurRadius: 8,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        CarouselSlider.builder(
          itemCount: movies.length,
          options: CarouselOptions(
            height: 330,
            enlargeCenterPage: true,
            enlargeFactor: 0.28,
            viewportFraction: 0.58,
            enableInfiniteScroll: true,
            autoPlay: false,
            onPageChanged: (index, reason) => onPageChanged(index),
          ),
          itemBuilder: (context, index, realIndex) {
            final movie = movies[index];
            return MovieCard(
              movie: movie,
              height: 330,
              width: 220,
            );
          },
        ),
      ],
    );
  }
}
