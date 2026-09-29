import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:movies/features/home/data/models/movie_model.dart';
import 'package:movies/features/home/domain/entities/movie.dart';
import 'dart:convert';

class MovieDetailsApiManager {
  static Dio dio = Dio(BaseOptions(baseUrl: "https://yts.gg/api"));
  static const String errorMessage = "Something Went wrong";

  // static Future<List<Torrents>> loadMoviesDetails(int MovieId) async {
  //   Response serverResponse = await dio.get(
  //     "/v2/movie_details.json",
  //     queryParameters: {"movie_id": MovieId},
  //   );
  //   debugPrint("status: ${serverResponse.statusCode}");
  //   debugPrint("url: ${serverResponse.realUri}");
  //   debugPrint("content-type: ${serverResponse.headers.value('content-type')}");
  //   debugPrint("body length: ${serverResponse.data.toString().length}");
  //   // final json = jsonDecode(serverResponse.body) as Map<String, dynamic>;
  //   try {
  //     print("getting data..");
  //     if (serverResponse.statusCode! >= 200 &&
  //         serverResponse.statusCode! < 300) {
  //       // Map<String, dynamic> json = serverResponse.data;
  //       final json = serverResponse.data is String
  //           ? jsonDecode(serverResponse.data) as Map<String, dynamic>
  //           : serverResponse.data as Map<String, dynamic>;
  //       print(serverResponse.headers.value("content-type"));
  //       print(serverResponse.data);
  //       final raw = serverResponse.data;
  //       if (raw == null || (raw is String && raw.trim().isEmpty)) {
  //         throw Exception(
  //           "Empty response (status ${serverResponse.statusCode}) from ${serverResponse.realUri}",
  //         );
  //       }
  //       var moviesResponse = Movie.fromJson(json);
  //       print("got Data");
  //       return moviesResponse.torrents ?? [];
  //     } else {
  //       print("couldn't get Data");
  //       throw errorMessage;
  //     }
  //   } on Exception catch (e) {
  //     print(e);
  //     rethrow;
  //   }
  // }

  static Future<Movie> loadMovieDetails(int movieId) async {
    final response = await dio.get(
      "/v2/movie_details.json",
      queryParameters: {"movie_id": movieId},
    );
    final movieJson = response.data?['data']?['movie'];
    if (movieJson is! Map<String, dynamic>) {
      throw Exception("Unexpected response shape: ${response.data}");
    }
    return Movie.fromJson(movieJson);
  }

  static Future<List<Movie>> loadMovieSuggestions(int movieId) async {
    final response = await dio.get(
      "/v2/movie_suggestions.json",
      queryParameters: {"movie_id": movieId},
    );

    final moviesJson = response.data?['data']?['movies'];
    if (moviesJson is! List) {
      throw Exception("Unexpected response shape: ${response.data}");
    }

    return moviesJson
        .whereType<Map<String, dynamic>>()
        .map(Movie.fromJson)
        .toList();
  }
}
