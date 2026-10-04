import 'package:movies/features/home/domain/entities/movie.dart';

abstract class SeeMoreState {}

class SeeMoreInitialState extends SeeMoreState {}

class SeeMoreLoadingState extends SeeMoreState {}

class SeeMoreSuccessState extends SeeMoreState {
  final List<MovieEntity> movies;

  SeeMoreSuccessState(this.movies);
}

class SeeMoreErrorState extends SeeMoreState {
  final String errorMessage;

  SeeMoreErrorState(this.errorMessage);
}