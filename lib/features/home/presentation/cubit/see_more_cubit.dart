import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/data/data_sources/api_manager.dart';
import 'package:movies/features/home/domain/entities/movie.dart';
import 'package:movies/features/home/presentation/cubit/see_more_state.dart';

class SeeMoreCubit extends Cubit<SeeMoreState> {
  SeeMoreCubit() : super(SeeMoreInitialState());

  static SeeMoreCubit get(context) => BlocProvider.of(context);

  Future<void> getGenreMovies(String genre) async {
    emit(SeeMoreLoadingState());
    try {
      final response = await ApiManager.getMovies(
        genre: genre,
        limit: 50,
        sortBy: 'rating',
      );
      final List<MovieEntity> movies = response.data?.movies ?? [];
      emit(SeeMoreSuccessState(movies));
    } catch (e) {
      emit(SeeMoreErrorState(e.toString()));
    }
  }
}