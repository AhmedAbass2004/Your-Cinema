import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_cinema/core/helpers/dependency_container.dart' as dc;
import 'package:your_cinema/features/movies/domain/entities/tv_show.dart';
import 'package:your_cinema/features/movies/domain/usecases/get_top_rated_tv_shows_use_case.dart';

final getTopRatedTvShowsUseCaseProvider = Provider<GetTopRatedTvShowsUseCase>(
  (ref) => dc.getIt<GetTopRatedTvShowsUseCase>(),
);

final topRatedTvShowsProvider = FutureProvider<List<TvShow>>((ref) async {
  final useCase = ref.watch(getTopRatedTvShowsUseCaseProvider);
  return await useCase();
});
