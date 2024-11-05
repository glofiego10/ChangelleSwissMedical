import 'package:bloc/bloc.dart';
import 'package:challenge_swiss/shared/domain/entity/movie.dart';
import 'package:challenge_swiss/shared/domain/enum/movie_category.dart';
import 'package:challenge_swiss/shared/domain/repo/repo_movie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_rated_event.dart';
part 'top_rated_state.dart';
part 'top_rated_bloc.freezed.dart';

class TopRatedBloc extends Bloc<TopRatedEvent, TopRatedState> {
  TopRatedBloc({required this.movieRepo}) : super(const _Initial()) {
    on<TopRatedEvent>((event, emit) async {
      await event.when(
        getMovies: () async {
          if (state is _Loading) return;

          emit(const _Loading());
          try {
            final results = await movieRepo.getMovies(
              category: MovieCategory.topRated.key,
              page: page,
            );

            emit(_Success(topRated: results));
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
