import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_cinema/features/movies/domain/entities/show.dart';
import 'package:your_cinema/features/movies/presentation/widgets/movie_list_item.dart';
import 'package:your_cinema/features/movies/presentation/widgets/section_headline_text.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({
    super.key,
    required this.topRatedMovies,
    required this.headline,
  });

  final AsyncValue<List<Show>> topRatedMovies;
  final String headline;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeadlineText(text: headline),
        SizedBox(
          height: 332,
          child: topRatedMovies.when(
            data: (movies) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, i) => MovieListItem(show: movies[i]),
              );
            },
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ),
      ],
    );
  }
}
