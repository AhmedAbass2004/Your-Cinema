import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_cinema/features/movies/domain/entities/movie.dart';
import 'package:your_cinema/features/movies/domain/usecases/get_trending_movies_use_case.dart';

import 'package:your_cinema/core/helpers/dependency_container.dart' as dc;

final trendingMoviesProvider = FutureProvider<List<Movie>>((ref) async {
  final useCase = dc.getIt<GetTrendingMoviesUsecase>();
  return await useCase();
});
