import 'dart:convert';

import 'package:http/http.dart';
import 'package:your_cinema/core/constants.dart';

class TmdbApi {
  final String baseUrl = "https://api.themoviedb.org/3";
  final String token = kToken;

  Future<Map> fetchData(String endpoint) async {
    final uri = Uri.parse("$baseUrl/$endpoint");
    final response = await get(
      uri,
      headers: {"accept": "application/json", "Authorization": "Bearer $token"},
    );
    if (response.statusCode != 200) {
      throw Exception("Failed to load data: ${response.statusCode}");
    }
    return jsonDecode(response.body);
  }
}
