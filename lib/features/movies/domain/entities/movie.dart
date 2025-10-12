import 'package:your_cinema/features/movies/domain/entities/show.dart';

class Movie extends Show {
  const Movie({
    required super.id,
    required super.title,
    required super.overview,
    required super.posterPath,
    required super.backdropPath,
    required super.voteAverage,
    required super.voteCount,
    required super.releaseDate,
    super.status,
    super.producers,
    super.homepage,
    super.tagline,
    this.runtime,
  });

  final int? runtime;
}
