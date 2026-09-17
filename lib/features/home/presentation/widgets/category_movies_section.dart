import 'package:flutter/material.dart';
import 'package:movies/core/app_colors.dart';
import 'package:movies/features/home/presentation/cubit/home_state.dart';
import 'package:movies/features/home/presentation/screens/see_more_screen.dart';
import 'package:movies/features/home/presentation/widgets/movie_card.dart';

class CategoryMoviesSection extends StatelessWidget {
  final MovieCategoryItem category;

  const CategoryMoviesSection({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    if (category.movies.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                category.genre,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SeeMoreScreen(genre: category.genre),
                    ),
                  );
                },
                behavior: HitTestBehavior.opaque,
                child: const Row(
                  children: [
                    Text(
                      'See More',
                      style: TextStyle(
                        color: AppColors.yellow,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.yellow,
                      size: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 195,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: category.movies.length,
            separatorBuilder: (_, __) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              final movie = category.movies[index];
              return MovieCard(
                movie: movie,
                height: 190,
                width: 125,
              );
            },
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}