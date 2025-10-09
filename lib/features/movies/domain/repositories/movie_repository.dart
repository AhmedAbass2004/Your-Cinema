import 'package:your_cinema/features/movies/domain/entities/movie.dart';
import 'package:your_cinema/features/movies/domain/entities/tv_show.dart';

abstract class MovieRepository {
  Future<List<Movie>> getTrendingMovies();

  Future<List<Movie>> getTopRatedMovies();

  Future<List<TvShow>> getTopRatedTvShows();
}
