import 'dart:convert';

import 'package:http/http.dart';
import 'package:your_cinema/core/constants.dart';
import 'package:your_cinema/features/movies/data/models/movie.dart';

class TmdbApi {
  final String baseUrl = "https://api.themoviedb.org/3";
  final String token = kToken;

  Future<List<MovieModel>> getTrendingMovies(String endpoint) async {
    final uri = Uri.parse("$baseUrl/$endpoint");
    final response = await get(
      uri,
      headers: {"accept": "application/json", "Authorization": "Bearer $token"},
    );
    final Map decodedJeson = jsonDecode(response.body);
    final List results = decodedJeson['results'];
    return results.map((e) => MovieModel.fromJson(e)).toList();
  }
}
