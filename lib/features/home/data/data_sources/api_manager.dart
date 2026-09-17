import 'package:dio/dio.dart';
import 'package:movies/features/home/data/models/movie_model.dart';

class ApiManager {
  static const String _baseUrl = 'https://yts.gg/api/v2';
  static const String _moviesEndpoint = '/list_movies.json';

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      responseType: ResponseType.json,
    ),
  );

  static Future<MovieModel> getMovies({
    int? page,
    int? limit,
    String? quality,
    int? minimumRating,
    String? queryTerm,
    String? genre,
    String? sortBy,
    String? orderBy,
  }) async {
    final Map<String, dynamic> params = {};

    if (page != null) params['page'] = page;
    if (limit != null) params['limit'] = limit;
    if (quality != null && quality.isNotEmpty) params['quality'] = quality;
    if (minimumRating != null) params['minimum_rating'] = minimumRating;
    if (queryTerm != null && queryTerm.isNotEmpty) params['query_term'] = queryTerm;
    if (genre != null && genre.isNotEmpty) params['genre'] = genre;
    if (sortBy != null && sortBy.isNotEmpty) params['sort_by'] = sortBy;
    if (orderBy != null && orderBy.isNotEmpty) params['order_by'] = orderBy;

    try {
      final response = await _dio.get(
        _moviesEndpoint,
        queryParameters: params.isNotEmpty ? params : null,
      );

      if (response.statusCode == 200 && response.data != null) {
        return MovieModel.fromJson(response.data as Map<String, dynamic>);
      }

      throw Exception('Failed to load movies. Status: ${response.statusCode}');
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }
}