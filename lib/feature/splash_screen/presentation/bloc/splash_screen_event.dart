part of 'splash_screen_bloc.dart';

@freezed
class SplashScreenEvent with _$SplashScreenEvent {
  const factory SplashScreenEvent.success() = _SuccessFetch;
  const factory SplashScreenEvent.error() = _ErrorFetch;
}
