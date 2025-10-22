import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:your_cinema/features/movies/domain/entities/movie.dart';
import 'package:your_cinema/features/movies/presentation/widgets/movie_poster.dart';
import 'package:your_cinema/features/movies/presentation/widgets/section_headline_text.dart';

class TrendsSections extends StatelessWidget {
  const TrendsSections({super.key, required this.trendingMovies});

  final AsyncValue<List<Movie>> trendingMovies;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeadlineText(text: 'Trending Now'),
        SizedBox(height: 5.h),
        trendingMovies.when(
          data: (movies) {
            return SizedBox(
              height: 240.h,
              child: PageView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final Movie movie = movies[index];
                  return MoviePoster(movie: movie);
                },
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
        ),
      ],
    );
  }
}
