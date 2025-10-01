import 'package:your_cinema/features/movies/domain/entities/movie.dart';
import 'package:your_cinema/features/movies/domain/repositories/movie_repository.dart';

class GetTrendingMoviesUsecase {
  final MovieRepository repository;

  GetTrendingMoviesUsecase({required this.repository});

  Future<List<Movie>> call() async {
    return await repository.getTrendingMovies();
  }
}
