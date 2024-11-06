import 'package:auto_route/auto_route.dart';
import 'package:challenge_swiss/core/routes/router.dart';
import 'package:challenge_swiss/shared/domain/entity/movie.dart';
import 'package:challenge_swiss/shared/presentation/widgets/cached_image_network.dart';
import 'package:flutter/material.dart';

class PopularCard extends StatelessWidget {
  const PopularCard({
    required this.movie,
    required this.index,
    super.key,
  });
  final Movie movie;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.navigate(MovieDetailsRoute(id: movie.id));
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            (index + 1).toString(),
            style: const TextStyle(
              fontSize: 150,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              shadows: [
                Shadow(
                  blurRadius: 15,
                  offset: Offset(2, 2),
                  color: Colors.white,
                ),
                Shadow(
                  blurRadius: 15,
                  offset: Offset(2, 2),
                  color: Colors.white,
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedImageWidget(
              imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
              width: 120,
              height: 180,
            ),
          ),
        ],
      ),
    );
  }
}
