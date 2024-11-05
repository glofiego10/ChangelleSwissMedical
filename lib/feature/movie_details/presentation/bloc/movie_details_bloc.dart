import 'package:bloc/bloc.dart';
import 'package:challenge_swiss/feature/movie_details/domain/repo/movie_details_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/movie_details.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';
part 'movie_details_bloc.freezed.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc({required this.movieDetailsRepo}) : super(const _Initial()) {
    on<MovieDetailsEvent>((event, emit) async {
      await event.when(
        getDetails: (id) async {
          emit(const _Loading());
          try {
            final movie = await movieDetailsRepo.getDetails(id);

            emit(_Success(movie: movie));
          } catch (e) {
            emit(const _Error());
          }
        },
      );
    });
  }

  final MovieDetailsRepositoy movieDetailsRepo;
}
