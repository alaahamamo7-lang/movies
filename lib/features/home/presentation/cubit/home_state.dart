import 'package:movies/features/home/domain/entities/movie.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class MovieCategoryItem {
  final String genre;
  final List<MovieEntity> movies;

  const MovieCategoryItem({
    required this.genre,
    required this.movies,
  });
}

class HomeSuccessState extends HomeState {
  final List<MovieEntity> availableMovies;
  final List<MovieCategoryItem> categories;
  final int currentCarouselIndex;

  HomeSuccessState({
    required this.availableMovies,
    required this.categories,
    this.currentCarouselIndex = 0,
  });

  HomeSuccessState copyWith({
    List<MovieEntity>? availableMovies,
    List<MovieCategoryItem>? categories,
    int? currentCarouselIndex,
  }) {
    return HomeSuccessState(
      availableMovies: availableMovies ?? this.availableMovies,
      categories: categories ?? this.categories,
      currentCarouselIndex: currentCarouselIndex ?? this.currentCarouselIndex,
    );
  }
}

class HomeErrorState extends HomeState {
  final String errorMessage;

  HomeErrorState(this.errorMessage);
}