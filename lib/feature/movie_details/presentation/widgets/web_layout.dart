import 'package:challenge_swiss/core/constants/app_button_styles.dart';
import 'package:challenge_swiss/core/constants/app_colors.dart';
import 'package:challenge_swiss/core/constants/app_text_style.dart';
import 'package:challenge_swiss/feature/movie_details/domain/entity/movie_details.dart';
import 'package:challenge_swiss/shared/presentation/widgets/cached_image_network.dart';
import 'package:flutter/material.dart';

import 'date_and_rate.dart';
import 'movie_gender.dart';

class WebLayout extends StatelessWidget {
  const WebLayout({required this.movie, super.key});

  final MovieDetails movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              CachedImageWidget(
                imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                height: 400,
                width: double.infinity,
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, color: AppColors.red),
              ),
              const SizedBox(height: 20),
              DateAndRateMovie(
                date: movie.releaseDate,
                rating: movie.rating,
              ),
            ],
          ),
        ),
        const SizedBox(width: 30),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: AppTextStyle.tittleText.copyWith(fontSize: 32),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 20),
              GenderMovie(genres: movie.genres),
              const SizedBox(height: 20),
              const Text(
                'Sinopsis',
                style: AppTextStyle.subTittleText,
              ),
              const SizedBox(height: 8),
              Text(
                movie.overview,
                style: AppTextStyle.textStyle1,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.play_arrow),
                label: const Text(
                  'Ver Tráiler',
                  style: AppTextStyle.textStyle1,
                ),
                style: AppButtonStyle.buttonStyleCommon,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
