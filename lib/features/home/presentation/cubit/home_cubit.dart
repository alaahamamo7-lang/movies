import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/data/data_sources/api_manager.dart';
import 'package:movies/features/home/domain/entities/movie.dart';
import 'package:movies/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  Future<void> getHomeData() async {
    emit(HomeLoadingState());
    try {
      final availableFuture = ApiManager.getMovies(
        limit: 10,
        sortBy: 'year',
      );

      final allGenres = [
        'Action',
        'Drama',
        'Comedy',
        'Adventure',
        'Animation',
        'Horror',
        'Sci-Fi',
        'Romance',
        'Thriller',
      ]..shuffle();

      final selectedGenres = allGenres.take(4).toList();

      final genreFutures = selectedGenres
          .map((genre) => ApiManager.getMovies(limit: 10, genre: genre))
          .toList();

      final results = await Future.wait([availableFuture, ...genreFutures]);

      final availableResponse = results[0];
      final List<MovieEntity> availableList =
          availableResponse.data?.movies ?? [];

      final List<MovieCategoryItem> categoryItems = [];
      for (int i = 0; i < selectedGenres.length; i++) {
        final genre = selectedGenres[i];
        final genreResponse = results[i + 1];
        final List<MovieEntity> movies = genreResponse.data?.movies ?? [];
        if (movies.isNotEmpty) {
          categoryItems.add(MovieCategoryItem(genre: genre, movies: movies));
        }
      }

      emit(HomeSuccessState(
        availableMovies: availableList,
        categories: categoryItems,
        currentCarouselIndex: 0,
      ));
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }

  void updateCarouselIndex(int index) {
    if (state is HomeSuccessState) {
      final currentState = state as HomeSuccessState;
      emit(currentState.copyWith(currentCarouselIndex: index));
    }
  }
}