import 'package:auto_route/auto_route.dart';
import 'package:challenge_swiss/core/constants/app_button_styles.dart';
import 'package:challenge_swiss/core/constants/app_colors.dart';
import 'package:challenge_swiss/core/constants/app_text_style.dart';
import 'package:challenge_swiss/core/di/injections_container.dart';
import 'package:challenge_swiss/feature/movie_details/presentation/bloc/movie_details_bloc.dart';
import 'package:challenge_swiss/shared/presentation/widgets/cached_image_network.dart';
import 'package:challenge_swiss/shared/presentation/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widget.dart';

@RoutePage()
class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({required this.id, super.key});
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailsBloc(movieDetailsRepo: di())
        ..add(MovieDetailsEvent.getDetails(id: id)),
      child: const MovieDetailsView(),
    );
  }
}

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
      ),
      body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: LoadingIndicator()),
            success: (movie) {
              return Stack(
                children: [
                  CachedImageWidget(
                    imageUrl:
                        'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                    height: double.infinity,
                    width: double.infinity,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error, color: AppColors.red),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: AppColors.gradientBlack,
                    ),
                  ),
                  SafeArea(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: Column(
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
                              label: const Text('Ver Tráiler'),
                              style: AppButtonStyle.buttonStyleCommon,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
