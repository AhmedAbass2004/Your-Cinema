import 'package:your_cinema/core/constants/api_constants.dart';
import 'package:your_cinema/features/movies/data/models/producer_model.dart';
import 'package:your_cinema/features/movies/domain/entities/tv_show.dart';

class TvShowModel extends TvShow {
  TvShowModel({
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
    super.lastAirDate,
    super.numberOfEpisodes,
    super.numberOfSeasons,
  });

  factory TvShowModel.fromJson(Map<String, dynamic> json) {
    final List<ProducerModel> producersList =
        json['production_companies'] == null
        ? []
        : List<ProducerModel>.from(
            (json['production_companies'] as List).map(
              (x) => ProducerModel.fromJson(x),
            ),
          );
    try {
      return TvShowModel(
        id: json['id'],
        title: json['name'],
        overview: json['overview'],
        posterPath: kImageBaseUrl + json['poster_path'],
        backdropPath: kImageBaseUrl + json['backdrop_path'],
        releaseDate: json['first_air_date'],
        status: json['status'],
        voteAverage: (json['vote_average']).toDouble(),
        voteCount: json['vote_count'],
        producers: producersList,
        lastAirDate: json['last_air_date'],
        numberOfEpisodes: json['number_of_episodes'],
        numberOfSeasons: json['number_of_seasons'],
      );
    } catch (e) {
      throw Exception('Error parsing MovieModel: $e');
    }
  }
}
