import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_cinema/features/movies/domain/entities/movie.dart';
import 'package:your_cinema/features/movies/domain/usecases/get_top_rated_movies_use_case.dart';

import 'package:your_cinema/core/helpers/dependency_container.dart' as dc;

final getTopRatedMoviesUseCaseProvider = Provider<GetTopRatedMoviesUseCase>(
  (ref) => dc.getIt<GetTopRatedMoviesUseCase>(),
);

final topRatedMoviesProvider = FutureProvider<List<Movie>>((ref) async {
  final useCase = ref.watch(getTopRatedMoviesUseCaseProvider);
  return await useCase();
});
