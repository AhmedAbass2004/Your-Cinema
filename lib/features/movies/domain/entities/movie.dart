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
