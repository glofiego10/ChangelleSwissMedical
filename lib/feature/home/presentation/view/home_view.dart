import 'package:auto_route/auto_route.dart';
import 'package:challenge_swiss/feature/home/presentation/blocs/top_rated/top_rated_bloc.dart';
import 'package:challenge_swiss/shared/domain/entity/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black54,
      body: TopRatedView(),
    );
  }
}

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
              const CircularProgressIndicator();
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
        return ListView.separated(
          controller: _scrollController
            ..addListener(() {
              if (_scrollController.offset ==
                  _scrollController.position.maxScrollExtent) {
                context
                    .read<TopRatedBloc>()
                    .add(const TopRatedEvent.getMovies());
              }
            }),
          itemBuilder: (context, index) => MovieCard(
            movie: _movie[index],
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemCount: _movie.length,
        );
      },
    );
  }
}
