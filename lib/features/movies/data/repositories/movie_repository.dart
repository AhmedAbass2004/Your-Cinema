import 'package:your_cinema/features/movies/data/data_sources/tmdb_api.dart';
import 'package:your_cinema/features/movies/domain/entities/movie.dart';
import 'package:your_cinema/features/movies/domain/entities/tv_show.dart';
import 'package:your_cinema/features/movies/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final TmdbApi api;

  MovieRepositoryImpl({required this.api});

  @override
  Future<List<Movie>> getTrendingMovies() async {
    const endpoint = '/trending/movie/day?page=1';
    return await api.getMoviesList(endpoint);
  }

  @override
  Future<List<Movie>> getTopRatedMovies() async {
    const endpoint = 'movie/top_rated?page=1';
    return await api.getMoviesList(endpoint);
  }

  @override
  Future<List<TvShow>> getTopRatedTvShows() async {
    const endpoint = 'tv/top_rated?page=1';
    return await api.getTvShowsList(endpoint);
  }
}
