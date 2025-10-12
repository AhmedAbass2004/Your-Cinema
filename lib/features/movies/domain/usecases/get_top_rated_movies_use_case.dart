import 'package:your_cinema/features/movies/domain/entities/movie.dart';
import 'package:your_cinema/features/movies/domain/repositories/movie_repository.dart';

class GetTopRatedMoviesUseCase {
  const GetTopRatedMoviesUseCase({required this.repository});

  final MovieRepository repository;

  Future<List<Movie>> call() async {
    return await repository.getTopRatedMovies();
  }
}
