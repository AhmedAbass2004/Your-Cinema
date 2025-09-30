import 'package:your_cinema/features/movies/data/models/movie.dart';
import 'package:your_cinema/services/api/tmdb_api.dart';

class MovieRepository {
  List<Movie>? _trendingMovies;
  final TmdbApi api = TmdbApi();

  Future<List<Movie>> get trendingMovies async {
    if (_trendingMovies != null) {
      return _trendingMovies!;
    }
    const String endpoint = "trending/movie/day?language=en-US";
    final response = await api.fetchData(endpoint);
    final List results = response['results'];
    _trendingMovies = results.map((e) => Movie.fromJson(e)).toList();
    return _trendingMovies!;
  }
}
