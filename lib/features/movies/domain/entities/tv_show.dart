import 'package:your_cinema/features/movies/domain/entities/show.dart';

class TvShow extends Show {
  TvShow({
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
    this.lastAirDate,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    super.tagline,
  });

  final String? lastAirDate;
  final int? numberOfEpisodes;
  final int? numberOfSeasons;
}
