import 'package:auto_route/auto_route.dart';
import 'package:challenge_swiss/core/constants/app_colors.dart';
import 'package:challenge_swiss/core/di/injections_container.dart';
import 'package:challenge_swiss/feature/movie_details/presentation/bloc/movie_details_bloc.dart';
import 'package:challenge_swiss/feature/movie_details/presentation/widgets/mobile_layaout.dart';
import 'package:challenge_swiss/feature/movie_details/presentation/widgets/web_layout.dart';
import 'package:challenge_swiss/shared/presentation/widgets/cached_image_network.dart';
import 'package:challenge_swiss/shared/presentation/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              return LayoutBuilder(
                builder: (context, constraints) {
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
                          child: constraints.maxWidth > 600
                              ? WebLayout(movie: movie)
                              : MobileLayaout(movie: movie),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
