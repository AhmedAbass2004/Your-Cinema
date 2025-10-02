import 'package:your_cinema/features/movies/data/data_sources/tmdb_api.dart';
import 'package:your_cinema/features/movies/domain/entities/movie.dart';
import 'package:your_cinema/features/movies/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final TmdbApi api;

  MovieRepositoryImpl({required this.api});

  @override
  Future<List<Movie>> getTrendingMovies() async {
    const endpoint = '/trending/movie/day';
    return await api.getTrendingMovies(endpoint);
  }
}
