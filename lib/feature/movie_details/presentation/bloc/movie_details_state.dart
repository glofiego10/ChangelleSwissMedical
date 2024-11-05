part of 'movie_details_bloc.dart';

@freezed
class MovieDetailsState with _$MovieDetailsState {
  const factory MovieDetailsState.initial() = _Initial;
  const factory MovieDetailsState.success({required MovieDetails movie}) =
      _Success;
  const factory MovieDetailsState.loading() = _Loading;
  const factory MovieDetailsState.error({String? error}) = _Error;
}
