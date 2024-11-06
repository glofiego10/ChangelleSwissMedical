import 'package:auto_route/auto_route.dart';
import 'package:challenge_swiss/core/routes/router.dart';
import 'package:challenge_swiss/shared/domain/entity/movie.dart';
import 'package:challenge_swiss/shared/presentation/widgets/cached_image_network.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({required this.movie, super.key});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.navigate(MovieDetailsRoute(id: movie.id));
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            CachedImageWidget(
              imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
            ),
            const SizedBox(height: 5),
            Text(
              movie.title,
              style: const TextStyle(color: Colors.white, fontSize: 20),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
