import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_cinema/features/movies/data/data_sources/tmdb_api.dart';
import 'package:your_cinema/features/movies/data/repositories/movie_repository.dart';
import 'package:your_cinema/features/movies/domain/entities/movie.dart';
import 'package:your_cinema/features/movies/domain/usecases/get_trending_moview_usecase.dart';

final trendingMoviesProvider = FutureProvider<List<Movie>>((ref) async {
  final api = TmdbApi();
  final repository = MovieRepositoryImpl(api: api);
  final useCase = GetTrendingMoviesUsecase(repository: repository);
  return await useCase();
});
