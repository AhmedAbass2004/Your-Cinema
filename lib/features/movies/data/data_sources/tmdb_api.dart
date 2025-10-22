import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:your_cinema/core/constants/api_constants.dart';
import 'package:your_cinema/features/movies/data/models/movie_model.dart';
import 'package:your_cinema/features/movies/data/models/tv_show_model.dart';

class TmdbApi {
  final String baseUrl = "https://api.themoviedb.org/3";
  final String token = kToken;

  Future<List<MovieModel>> getMoviesList(String endpoint) async {
    final uri = Uri.parse("$baseUrl/$endpoint");
    try {
      final response = await get(
        uri,
        headers: {
          "accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      final Map decodedJeson = jsonDecode(response.body);
      final List results = decodedJeson['results'];
      return results.map((e) => MovieModel.fromJson(e)).toList();
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<List<TvShowModel>> getTvShowsList(String endpoint) async {
    final uri = Uri.parse("$baseUrl/$endpoint");
    try {
      final response = await get(
        uri,
        headers: {
          "accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      final Map decodedJeson = jsonDecode(response.body);
      final List results = decodedJeson['results'];
      return results.map((e) => TvShowModel.fromJson(e)).toList();
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}

final tmdbApiProvider = Provider<TmdbApi>((ref) {
  return TmdbApi();
});
