class Movie {
  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.language,
    required this.genreIds,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    String id = json['id'].toString(),
        title = json['title'] ?? 'No Title',
        overview = json['overview'] ?? 'No Overview',
        posterPath = json['poster_path'] ?? '',
        language = json['original_language'] ?? 'N/A',
        releaseDate = json['release_date'] ?? 'N/A';
    double voteAverage = (json['vote_average'] ?? 0).toDouble();
    int voteCount = json['vote_count'] ?? 0;

    List<int> genreIds = List<int>.from(json['genre_ids'] ?? []);
    return Movie(
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

  final String id;
  final String title;
  final String overview;
  final String posterPath;
  final String language;
  final List<int> genreIds;
  final String releaseDate;
  final double voteAverage;
  final int voteCount;
}
