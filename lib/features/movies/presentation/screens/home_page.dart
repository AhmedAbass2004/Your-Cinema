import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_cinema/features/movies/domain/entities/movie.dart';
import 'package:your_cinema/features/movies/presentation/providers/trending_movies_provider.dart';
import 'package:your_cinema/features/movies/presentation/widgets/movie_poster.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Cinema")),
      body: ListView(
        children: [
          FutureBuilder(
            future: ref.watch(trendingMoviesProvider.future),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              }
              if (!snapshot.hasData) {
                return const Center(child: Text("No Data Found"));
              }
              return SizedBox(
                height: 500,
                child: PageView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final Movie movie = snapshot.data![index];
                    return MoviePoster(movie: movie);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
