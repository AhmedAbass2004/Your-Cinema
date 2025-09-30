import 'package:flutter/material.dart';
import 'package:your_cinema/features/movies/data/models/movie.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          "https://image.tmdb.org/t/p/w500${movie.posterPath}",
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(5),
            color: Colors.black54,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Rating: ${(movie.voteAverage).toStringAsFixed(1)}",
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
