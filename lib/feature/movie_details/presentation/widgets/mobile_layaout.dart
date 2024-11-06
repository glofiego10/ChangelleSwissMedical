import 'package:challenge_swiss/core/constants/app_button_styles.dart';
import 'package:challenge_swiss/core/constants/app_text_style.dart';
import 'package:challenge_swiss/feature/movie_details/domain/entity/movie_details.dart';
import 'package:flutter/material.dart';

import 'widget.dart';

class MobileLayaout extends StatelessWidget {
  const MobileLayaout({required this.movie, super.key});

  final MovieDetails movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GenderMovie(genres: movie.genres),
        const SizedBox(height: 40),
        Center(
          child: Text(
            movie.title,
            style: AppTextStyle.tittleText,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 40),
        DateAndRateMovie(
          date: movie.releaseDate,
          rating: movie.rating,
        ),
        const SizedBox(height: 40),
        const Text(
          'Sinopsis',
          style: AppTextStyle.subTittleText,
        ),
        const SizedBox(height: 8),
        Text(
          movie.overview,
          style: AppTextStyle.textStyle1,
        ),
        const SizedBox(height: 40),
        Center(
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.play_arrow),
            label: const Text(
              'Ver Tráiler',
              style: AppTextStyle.textStyle1,
            ),
            style: AppButtonStyle.buttonStyleCommon,
          ),
        ),
      ],
    );
  }
}
