import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_cinema/features/movies/data/models/movie_model.dart';
import 'package:your_cinema/features/movies/domain/entities/movie.dart';
import 'package:your_cinema/features/movies/domain/usecases/get_top_rated_movies_use_case.dart';

final _getTopRatedMoviesUseCaseProvider = Provider<GetTopRatedMoviesUseCase>((
  ref,
) {
  final repository = ref.read(movieRepositoryProvider);
  return GetTopRatedMoviesUseCase(repository: repository);
});

final topRatedMoviesProvider = FutureProvider<List<Movie>>((ref) async {
  final useCase = ref.watch(_getTopRatedMoviesUseCaseProvider);
  return await useCase();
});
