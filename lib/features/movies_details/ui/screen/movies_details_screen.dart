import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/app_colors.dart';
import 'package:movies/core/constants/app_color.dart';
import 'package:movies/core/constants/routes/app_routes.dart';
import 'package:movies/features/auth/ui/weiget/button/custom_text_button.dart';
import 'package:movies/features/home/data/data_sources/api_manager.dart';
import 'package:movies/features/home/data/models/movie_model.dart';
import 'package:movies/features/home/domain/entities/movie.dart';
import 'package:movies/features/movies_details/data/api_manager.dart';
import 'package:movies/features/movies_details/ui/widget/card_widget.dart';
import 'package:movies/features/movies_details/ui/widget/custom_filled_button.dart';

class MoviesDetailsScreen extends StatefulWidget {
  final Movie movie;
  const MoviesDetailsScreen({super.key, required this.movie});

  @override
  State<MoviesDetailsScreen> createState() => _MoviesDetailsScreenState();
}

class _MoviesDetailsScreenState extends State<MoviesDetailsScreen> {
  late final Future<Movie> _future;
  late final Future<List<Movie>> _suggestionsFuture;
  @override
  void initState() {
    super.initState();
    _future = MovieDetailsApiManager.loadMovieDetails(widget.movie.id!);
    _suggestionsFuture = MovieDetailsApiManager.loadMovieSuggestions(
      widget.movie.id!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: MovieDetailsApiManager.loadMovieDetails(widget.movie.id!),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Card(
                  color: AppColors.black,
                  elevation: 10,
                  margin: const EdgeInsets.all(24),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24,
                      horizontal: 14,
                    ),
                    child: Text(
                      snapshot.error.toString(),
                      style: TextStyle(
                        color: AppColor.red,
                        fontSize: 14,
                        fontWeight: .w600,
                      ),
                    ),
                  ),
                ),
              );
            }
            if (!snapshot.hasData) {
              return Center(
                child: Card(
                  color: AppColor.bgColor,
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            }
            return SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // padding: EdgeInsets.all(12),
                    height: MediaQuery.of(context).size.height * .5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(snapshot.data!.largeCoverImage!),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(Icons.arrow_back_ios),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.bookmark),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          snapshot.data!.title!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: .w700,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 12),
                        CustomFilledButton(labelText: "Watch", onTap: () {}),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        color: Colors.transparent,
                        elevation: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 26,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.second,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.favorite, color: AppColor.primary),
                              const SizedBox(width: 8),
                              Text(
                                '${snapshot.data!.mpaRating}',
                                style: TextStyle(color: AppColors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.transparent,
                        elevation: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 26,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.second,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.timer, color: AppColor.primary),
                              const SizedBox(width: 8),
                              Text(
                                '${snapshot.data!.runtime}',
                                style: TextStyle(color: AppColors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.transparent,
                        elevation: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 26,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.second,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.star, color: AppColor.primary),
                              const SizedBox(width: 8),
                              Text(
                                '${snapshot.data!.rating}',
                                style: TextStyle(color: AppColors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ScreenShoots",
                          style: TextStyle(
                            color: AppColor.white,
                            fontWeight: .w700,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height * .15,
                            width: MediaQuery.of(context).size.width * .9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Image.network(
                              snapshot.data!.backgroundImageOriginal!,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Similar",
                          style: TextStyle(
                            color: AppColor.white,
                            fontWeight: .w700,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 12),
                        FutureBuilder<List<Movie>>(
                          future: _suggestionsFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (snapshot.hasError) {
                              return Text(
                                'Failed to load suggestions: ${snapshot.error}',
                              );
                            }
                            final movies = snapshot.data ?? [];
                            if (movies.isEmpty) return const SizedBox.shrink();

                            return GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: movies.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 12,
                                    childAspectRatio: 0.8,
                                  ),
                              itemBuilder: (context, index) {
                                final movie = movies[index];
                                return InkWell(
                                  onTap: () => Navigator.push(
                                    context,
                                    AppRoutes.moviesDetailsScreen(movie: movie),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      movie.mediumCoverImage ?? '',
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, __, ___) =>
                                          const Center(
                                            child: Icon(
                                              Icons.broken_image,
                                              color: AppColor.primary,
                                            ),
                                          ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Summary",
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: .w700,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          widget.movie.summary.toString(),
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: .w400,
                            fontSize: 16,
                          ),
                        ),
                        // const SizedBox(height: 8),
                        // Text(
                        //   "Cast",
                        //   style: TextStyle(
                        //     color: AppColors.white,
                        //     fontWeight: .w700,
                        //     fontSize: 24,
                        //   ),
                        // ),
                        // ListView.separated(
                        //   shrinkWrap: true,
                        //   physics: const NeverScrollableScrollPhysics(),
                        //   itemBuilder: (context, index) => Container(
                        //     width: double.infinity,
                        //     height: 50,
                        //     decoration: BoxDecoration(
                        //       color: AppColor.second,
                        //       borderRadius: BorderRadius.circular(16),
                        //     ),
                        //     child: Text('${snapshot.data!}'),
                        //   ),
                        //   separatorBuilder: (context, index) =>
                        //       const SizedBox(height: 8),
                        //   itemCount: 3,
                        // ),
                        const SizedBox(height: 8),
                        Text(
                          "Geners",
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: .w700,
                            fontSize: 24,
                          ),
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 8,
                                mainAxisExtent: 40,
                                mainAxisSpacing: 8,
                                childAspectRatio: 10,
                              ),
                          itemBuilder: (context, index) => Container(
                            // height: 100,
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.second,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              textAlign: TextAlign.center,
                              '${snapshot.data!.genres![index]}',
                              // "",
                              style: TextStyle(color: AppColors.white),
                            ),
                          ),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.genres!.length,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
