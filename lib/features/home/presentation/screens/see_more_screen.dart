import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/app_colors.dart';
import 'package:movies/features/home/presentation/cubit/see_more_cubit.dart';
import 'package:movies/features/home/presentation/cubit/see_more_state.dart';
import 'package:movies/features/home/presentation/widgets/movie_card.dart';

class SeeMoreScreen extends StatelessWidget {
  final String genre;

  const SeeMoreScreen({
    super.key,
    required this.genre,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SeeMoreCubit()..getGenreMovies(genre),
      child: Scaffold(
        backgroundColor: AppColors.black,
        appBar: AppBar(
          backgroundColor: AppColors.black,
          elevation: 0,
          title: Text(
            '$genre Movies',
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.yellow),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: BlocBuilder<SeeMoreCubit, SeeMoreState>(
          builder: (context, state) {
            if (state is SeeMoreLoadingState) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.yellow),
              );
            }

            if (state is SeeMoreErrorState) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: AppColors.red,
                        size: 50,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        state.errorMessage,
                        style: const TextStyle(color: AppColors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.yellow,
                          foregroundColor: AppColors.black,
                        ),
                        onPressed: () {
                          context.read<SeeMoreCubit>().getGenreMovies(genre);
                        },
                        child: const Text('Try Again'),
                      ),
                    ],
                  ),
                ),
              );
            }

            if (state is SeeMoreSuccessState) {
              final movies = state.movies;
              if (movies.isEmpty) {
                return const Center(
                  child: Text(
                    'No movies found for this category.',
                    style: TextStyle(color: AppColors.white, fontSize: 16),
                  ),
                );
              }

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.68,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    final movie = movies[index];
                    return MovieCard(
                      movie: movie,
                      height: double.infinity,
                      width: double.infinity,
                    );
                  },
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}