import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_cinema/features/movies/data/models/movie.dart';
import 'package:your_cinema/features/movies/providers/movie_repository_provider.dart';

final trendingMoviesProvider = FutureProvider<List<Movie>>((ref) async {
  final repository = ref.watch(movieRepositoryProvider);
  return repository.trendingMovies;
});
