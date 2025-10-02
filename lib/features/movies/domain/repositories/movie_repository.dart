import 'package:your_cinema/features/movies/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getTrendingMovies();
}
