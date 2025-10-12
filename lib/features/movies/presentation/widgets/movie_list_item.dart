import 'package:flutter/material.dart';
import 'package:your_cinema/features/movies/domain/entities/show.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({super.key, required this.show});

  final Show show;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8),
      width: 150,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.network(
              show.posterPath,
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 18),
                    SizedBox(width: 5),
                    Text(
                      show.voteAverage.toStringAsFixed(1),
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                  child: Text(
                    show.title,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  show.releaseDate,
                  style: const TextStyle(color: Colors.white54, fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
