part of 'upcoming_bloc.dart';

@freezed
class UpcomingState with _$UpcomingState {
  const factory UpcomingState.initial() = _Initial;
  const factory UpcomingState.loading() = _Loading;
  const factory UpcomingState.success({
    required List<Movie> upcoming,
  }) = _Success;
  const factory UpcomingState.error() = _Error;
}
