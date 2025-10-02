import 'package:get_it/get_it.dart';
import 'package:your_cinema/features/movies/data/data_sources/tmdb_api.dart';
import 'package:your_cinema/features/movies/data/repositories/movie_repository.dart';
import 'package:your_cinema/features/movies/domain/repositories/movie_repository.dart';
import 'package:your_cinema/features/movies/domain/usecases/get_trending_moview_usecase.dart';

final GetIt getIt = GetIt.instance;

void init() {
  // <------------ Freatures ------------>

  // << Movies >>

  // Use Cases:

  // - Trending Movies

  getIt.registerLazySingleton(
    () => GetTrendingMoviesUsecase(repository: getIt()),
  );

  // Repositories:

  // - Movie Repository

  getIt.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(api: getIt()),
  );

  // Data Sources:

  // - TMDB API

  getIt.registerLazySingleton(() => TmdbApi());
}
