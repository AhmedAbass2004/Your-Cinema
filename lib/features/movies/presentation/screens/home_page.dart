import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_cinema/core/shared_widgets/main_app_bar.dart';
import 'package:your_cinema/features/movies/presentation/providers/top_rated_movies_provider.dart';
import 'package:your_cinema/features/movies/presentation/providers/top_rated_tv_shows_provider.dart';
import 'package:your_cinema/features/movies/presentation/providers/trending_movies_provider.dart';
import 'package:your_cinema/features/movies/presentation/widgets/movies_list.dart';
import 'package:your_cinema/features/movies/presentation/widgets/trends_sections.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: 'Your Cinema'),
      body: ListView(
        children: [
          TrendsSections(trendingMovies: ref.watch(trendingMoviesProvider)),
          SizedBox(height: 16),
          MoviesList(
            topRatedMovies: ref.watch(topRatedMoviesProvider),
            headline: 'Top Rated Movies',
          ),
          SizedBox(height: 16),
          MoviesList(
            topRatedMovies: ref.watch(topRatedTvShowsProvider),
            headline: 'Top Rated Series',
          ),
        ],
      ),
    );
  }
}
