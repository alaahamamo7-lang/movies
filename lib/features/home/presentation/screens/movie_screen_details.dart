import 'package:flutter/material.dart';
import 'package:movies/core/app_colors.dart';
import 'package:movies/features/home/domain/entities/movie.dart';

class MovieDetailsScreen extends StatelessWidget {
  final MovieEntity? movie;

  const MovieDetailsScreen({
    super.key,
    this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          movie?.title ?? 'Movie Details',
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.movie_outlined,
              size: 80,
              color: AppColors.grey,
            ),
            const SizedBox(height: 16),
            Text(
              movie?.title ?? 'Movie Details Screen',
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}