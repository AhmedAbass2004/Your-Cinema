import 'package:your_cinema/core/constants/api_constants.dart';
import 'package:your_cinema/features/movies/data/models/producer_model.dart';
import 'package:your_cinema/features/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
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
    super.runtime,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    final List<ProducerModel> producersList =
        json['production_companies'] == null
        ? []
        : List<ProducerModel>.from(
            (json['production_companies'] as List).map(
              (x) => ProducerModel.fromJson(x),
            ),
          );
    try {
      return MovieModel(
        id: json['id'],
        title: json['title'],
        overview: json['overview'],
        posterPath: kImageBaseUrl + json['poster_path'],
        backdropPath: kImageBaseUrl + json['backdrop_path'],
        releaseDate: json['release_date'],
        status: json['status'],
        runtime: json['runtime'],
        voteAverage: (json['vote_average']).toDouble(),
        voteCount: json['vote_count'],
        producers: producersList,
      );
    } catch (e) {
      throw Exception('Error parsing MovieModel: $e');
    }
  }
}
