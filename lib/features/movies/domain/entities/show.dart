import 'package:your_cinema/features/movies/domain/entities/producer.dart';

abstract class Show {
  const Show({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    this.homepage,
    required this.voteAverage,
    required this.voteCount,
    required this.releaseDate,
    this.status,
    this.producers,
    this.tagline,
  });

  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final String? homepage;
  final double voteAverage;
  final int voteCount;
  final String releaseDate;
  final String? status;
  final List<Producer>? producers;
  final String? tagline;
}
