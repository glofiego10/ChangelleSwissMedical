part of 'top_rated_bloc.dart';

@freezed
class TopRatedState with _$TopRatedState {
  const factory TopRatedState.initial() = _Initial;
  const factory TopRatedState.loading() = _Loading;
  const factory TopRatedState.success({
    required List<Movie> topRated,
  }) = _Success;
  const factory TopRatedState.error() = _Error;
}
