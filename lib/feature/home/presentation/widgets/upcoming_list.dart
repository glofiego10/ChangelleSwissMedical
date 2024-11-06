import 'package:challenge_swiss/core/constants/app_text_style.dart';
import 'package:challenge_swiss/feature/home/presentation/blocs/upcoming/upcoming_bloc.dart';
import 'package:challenge_swiss/shared/domain/entity/movie.dart';
import 'package:challenge_swiss/shared/presentation/widgets/loading_indicator.dart';
import 'package:challenge_swiss/shared/presentation/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingView extends StatefulWidget {
  const UpcomingView({super.key});

  @override
  _UpcomingViewState createState() => _UpcomingViewState();
}

class _UpcomingViewState extends State<UpcomingView> {
  final List<Movie> _movies = [];
  final _scrollController = ScrollController();

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
      context.read<UpcomingBloc>().add(const UpcomingEvent.getMovies());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpcomingBloc, UpcomingState>(
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
            if (_movies.isEmpty) {
              const LoadingIndicator();
            }
          },
          success: (movie) {
            _movies.addAll(movie);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
          error: () {
            if (_movies.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      context
                          .read<UpcomingBloc>()
                          .add(const UpcomingEvent.getMovies());
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
            const Text(
              'Proximamente',
              style: AppTextStyle.subTittleText,
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                controller: _scrollController,
                itemBuilder: (context, index) =>
                    MovieCard(movie: _movies[index]),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemCount: _movies.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
