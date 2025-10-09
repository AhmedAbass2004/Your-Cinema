import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:your_cinema/features/authentication/data/data_sources/firebase_auth_data_source.dart';
import 'package:your_cinema/features/authentication/data/data_sources/firebase_store_data_source.dart';
import 'package:your_cinema/features/authentication/data/repositories/users_repository_impl.dart';
import 'package:your_cinema/features/authentication/domain/repositories/users_repository.dart';
import 'package:your_cinema/features/authentication/domain/usecases/get_current_user_use_case.dart';
import 'package:your_cinema/features/authentication/domain/usecases/log_out_user_use_case.dart';
import 'package:your_cinema/features/authentication/domain/usecases/sing_up_usecase.dart';
import 'package:your_cinema/features/movies/data/data_sources/tmdb_api.dart';
import 'package:your_cinema/features/movies/data/repositories/movie_repository.dart';
import 'package:your_cinema/features/movies/domain/repositories/movie_repository.dart';
import 'package:your_cinema/features/movies/domain/usecases/get_top_rated_movies_use_case.dart';
import 'package:your_cinema/features/movies/domain/usecases/get_top_rated_tv_shows_use_case.dart';
import 'package:your_cinema/features/movies/domain/usecases/get_trending_movies_use_case.dart';

final GetIt getIt = GetIt.instance;

void init() {
  // <------------ Freatures ------------>

  // << Movies >>

  // Use Cases:

  // - Trending Movies

  getIt.registerLazySingleton<GetTrendingMoviesUsecase>(
    () => GetTrendingMoviesUsecase(repository: getIt()),
  );

  // - Top Rated Movies

  getIt.registerLazySingleton<GetTopRatedMoviesUseCase>(
    () => GetTopRatedMoviesUseCase(repository: getIt()),
  );

  // - Top Rated Tv Shows

  getIt.registerLazySingleton<GetTopRatedTvShowsUseCase>(
    () => GetTopRatedTvShowsUseCase(repository: getIt()),
  );

  // Repositories:

  // - Movie Repository

  getIt.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(api: getIt()),
  );

  // Data Sources:

  // - TMDB API

  getIt.registerLazySingleton(() => TmdbApi());

  //================================================

  // << Authentication >>

  // Use Cases:

  // - Create Account

  getIt.registerLazySingleton<SignUpUsecase>(
    () => SignUpUsecase(repository: getIt()),
  );

  // - Log Out User

  getIt.registerLazySingleton<LogOutUserUseCase>(
    () => LogOutUserUseCase(repository: getIt()),
  );

  // - Get Current User

  getIt.registerLazySingleton<GetCurrentUserUseCase>(
    () => GetCurrentUserUseCase(repository: getIt()),
  );

  // Repositories:

  // - Users Repository

  getIt.registerLazySingleton<UsersRepository>(
    () => UsersRepositoryImpl(
      firebaseAuthDataSource: getIt(),
      firebaseStoreDataSource: getIt(),
    ),
  );

  // Data Sources:

  // - Firebase Auth Data Source

  getIt.registerLazySingleton<FirebaseAuthDataSource>(
    () => FirebaseAuthDataSource(auth: getIt()),
  );

  getIt.registerLazySingleton<FirebaseStoreDataSource>(
    () => FirebaseStoreDataSource(firestore: getIt()),
  );

  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );
}
