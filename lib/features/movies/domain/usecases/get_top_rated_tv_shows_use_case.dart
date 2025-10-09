import 'package:your_cinema/features/movies/domain/entities/tv_show.dart';
import 'package:your_cinema/features/movies/domain/repositories/movie_repository.dart';

class GetTopRatedTvShowsUseCase {
  const GetTopRatedTvShowsUseCase({required this.repository});

  final MovieRepository repository;

  Future<List<TvShow>> call() async {
    return await repository.getTopRatedTvShows();
  }
}
