import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:your_cinema/features/movies/domain/entities/movie.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24.r),
            child: Container(
              color: Colors.black,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(movie.backdropPath),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 160.h,
              ),
            ),
          ),

          Container(
            height: 200.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
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
            left: 130.w,
            bottom: 50.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: TextStyle(color: Colors.white, fontSize: 18.sp),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  movie.releaseDate,
                  style: TextStyle(color: Colors.white70, fontSize: 15.sp),
                ),
                Row(
                  children: [
                    Text(
                      "Rating: ${movie.voteAverage.toStringAsFixed(1)}",
                      style: TextStyle(color: Colors.white70, fontSize: 14.sp),
                    ),
                    SizedBox(width: 5.h),
                    Icon(Icons.star, color: Colors.amber, size: 16.r),
                  ],
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 0,
            left: 15.w,
            width: 100.w,
            height: 115.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
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
