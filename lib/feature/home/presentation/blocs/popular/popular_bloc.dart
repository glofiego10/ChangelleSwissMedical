import 'package:bloc/bloc.dart';
import 'package:challenge_swiss/shared/domain/entity/movie.dart';
import 'package:challenge_swiss/shared/domain/enum/movie_category.dart';
import 'package:challenge_swiss/shared/domain/repo/repo_movie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'popular_event.dart';
part 'popular_state.dart';
part 'popular_bloc.freezed.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  PopularBloc({required this.movieRepo}) : super(const _Initial()) {
    on<PopularEvent>((event, emit) async {
      await event.when(
        getMovies: () async {
          if (state is _Loading) return;
          emit(const _Loading());
          try {
            final results = await movieRepo.getMovies(
              category: MovieCategory.popular.key,
              page: page,
            );

            emit(_Success(popular: results));
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
