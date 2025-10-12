import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:your_cinema/features/movies/domain/entities/movie.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Container(
              color: Colors.black,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(movie.backdropPath),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ),
          ),

          Container(
            height: 270,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black45,
                  Colors.black,
                  Colors.black,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          Positioned(
            left: 150,
            right: 10,
            bottom: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  movie.releaseDate,
                  style: const TextStyle(color: Colors.white70, fontSize: 15),
                ),
                Row(
                  children: [
                    Text(
                      "Rating: ${movie.voteAverage.toStringAsFixed(1)}",
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.star, color: Colors.amber, size: 16),
                  ],
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 0,
            left: 24,
            width: 110,
            height: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(movie.posterPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
