import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/app_colors.dart';
import 'package:movies/features/home/presentation/cubit/home_cubit.dart';
import 'package:movies/features/home/presentation/cubit/home_state.dart';
import 'package:movies/features/home/presentation/widgets/available_movies_section.dart';
import 'package:movies/features/home/presentation/widgets/category_movies_section.dart';
import 'package:movies/features/home/presentation/widgets/home_dynamic_background.dart';
import 'package:movies/features/home/presentation/widgets/watch_now_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.yellow,
                ),
              );
            }

            if (state is HomeErrorState) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: AppColors.red,
                        size: 60,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        state.errorMessage,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.yellow,
                          foregroundColor: AppColors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          context.read<HomeCubit>().getHomeData();
                        },
                        child: const Text('Try Again'),
                      ),
                    ],
                  ),
                ),
              );
            }

            if (state is HomeSuccessState) {
              final availableMovies = state.availableMovies;
              final categories = state.categories;
              final currentMovie = availableMovies.isNotEmpty
                  ? availableMovies[state.currentCarouselIndex
                  .clamp(0, availableMovies.length - 1)]
                  : null;

              return Stack(
                children: [
                  HomeDynamicBackground(movie: currentMovie),
                  SafeArea(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AvailableMoviesSection(
                            movies: availableMovies,
                            onPageChanged: (index) {
                              context
                                  .read<HomeCubit>()
                                  .updateCarouselIndex(index);
                            },
                          ),
                          const WatchNowHeader(),
                          ...categories.map(
                                (cat) => CategoryMoviesSection(category: cat),
                          ),
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}