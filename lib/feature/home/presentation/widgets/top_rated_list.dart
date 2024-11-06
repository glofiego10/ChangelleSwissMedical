import 'package:challenge_swiss/core/constants/app_text_style.dart';
import 'package:challenge_swiss/feature/home/presentation/blocs/top_rated/top_rated_bloc.dart';
import 'package:challenge_swiss/shared/domain/entity/movie.dart';
import 'package:challenge_swiss/shared/presentation/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../shared/presentation/widgets/popular_card.dart';

class TopRatedView extends StatefulWidget {
  const TopRatedView({super.key});

  @override
  _TopRatedViewState createState() => _TopRatedViewState();
}

class _TopRatedViewState extends State<TopRatedView> {
  final List<Movie> _movie = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<TopRatedBloc>().add(const TopRatedEvent.getMovies());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TopRatedBloc, TopRatedState>(
      listener: (context, state) {
        state.whenOrNull(
          error: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Ocurrio un error')),
            );
          },
          success: (movies) {
            if (movies.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No mas peliculas')),
              );
            }
          },
        );
      },
      builder: (context, state) {
        state.when(
          initial: () => const CircularProgressIndicator(),
          loading: () {
            if (_movie.isEmpty) {
              const LoadingIndicator();
            }
          },
          success: (movie) {
            _movie.addAll(movie);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
          error: () {
            if (_movie.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      context
                          .read<TopRatedBloc>()
                          .add(const TopRatedEvent.getMovies());
                    },
                    icon: const Icon(Icons.refresh),
                  ),
                  const SizedBox(height: 15),
                  const Text('Ocurrio un error', textAlign: TextAlign.center),
                ],
              );
            }
          },
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Top 100',
                  style: AppTextStyle.subTittleText,
                ),
                const SizedBox(width: 20),
                Icon(
                  MdiIcons.fire,
                  color: Colors.white.withOpacity(0.5),
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                controller: _scrollController,
                itemBuilder: (context, index) {
                  if (index == _movie.length) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return PopularCard(
                    movie: _movie[index],
                    index: index,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 20),
                itemCount: state.isLoading ? _movie.length + 1 : _movie.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
