import 'package:your_cinema/features/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.posterPath,
    required super.language,
    required super.genreIds,
    required super.releaseDate,
    required super.voteAverage,
    required super.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    String id = json['id'].toString(),
        title = json['title'] ?? 'No Title',
        overview = json['overview'] ?? 'No Overview',
        posterPath = json['poster_path'] ?? '',
        language = json['original_language'] ?? 'N/A',
        releaseDate = json['release_date'] ?? 'N/A';
    double voteAverage = (json['vote_average'] ?? 0).toDouble();
    int voteCount = json['vote_count'] ?? 0;

    List<int> genreIds = List<int>.from(json['genre_ids'] ?? []);
    return MovieModel(
      id: id,
      title: title,
      overview: overview,
      posterPath: posterPath,
      language: language,
      genreIds: genreIds,
      releaseDate: releaseDate,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}
