import 'package:bloc/bloc.dart';
import 'package:challenge_swiss/shared/domain/entity/movie.dart';
import 'package:challenge_swiss/shared/domain/enum/movie_category.dart';
import 'package:challenge_swiss/shared/domain/repo/repo_movie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'upcoming_event.dart';
part 'upcoming_state.dart';
part 'upcoming_bloc.freezed.dart';

class UpcomingBloc extends Bloc<UpcomingEvent, UpcomingState> {
  UpcomingBloc({required this.movieRepo}) : super(const _Initial()) {
    on<UpcomingEvent>((event, emit) async {
      await event.when(
        getMovies: () async {
          if (state is _Loading) return;
          emit(const _Loading());
          try {
            final results = await movieRepo.getMovies(
              category: MovieCategory.upcoming.key,
              page: page,
            );

            emit(_Success(upcoming: results));
            page++;
          } catch (e) {
            emit(const _Error());
          }
        },
      );
    });
  }

  final MovieRepository movieRepo;
  int page = 1;
}
