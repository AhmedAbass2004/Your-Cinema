import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_cinema/features/movies/data/models/movie_model.dart';
import 'package:your_cinema/features/movies/domain/entities/tv_show.dart';
import 'package:your_cinema/features/movies/domain/usecases/get_top_rated_tv_shows_use_case.dart';

final getTopRatedTvShowsUseCaseProvider = Provider<GetTopRatedTvShowsUseCase>((
  ref,
) {
  final repository = ref.read(movieRepositoryProvider);
  return GetTopRatedTvShowsUseCase(repository: repository);
});

final topRatedTvShowsProvider = FutureProvider<List<TvShow>>((ref) async {
  final useCase = ref.watch(getTopRatedTvShowsUseCaseProvider);
  return await useCase();
});
