import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_cinema/features/movies/data/repositories/movie_repository.dart';

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  return MovieRepository();
});
