import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_cinema/features/movies/data/models/movie_model.dart';
import 'package:your_cinema/features/movies/domain/entities/movie.dart';
import 'package:your_cinema/features/movies/domain/usecases/get_trending_movies_use_case.dart';

final getTrendingMoviesUsecaseProvider = Provider<GetTrendingMoviesUsecase>((
  ref,
) {
  final repository = ref.read(movieRepositoryProvider);
  return GetTrendingMoviesUsecase(repository: repository);
});

final trendingMoviesProvider = FutureProvider<List<Movie>>((ref) async {
  final useCase = ref.read(getTrendingMoviesUsecaseProvider);
  return await useCase();
});
