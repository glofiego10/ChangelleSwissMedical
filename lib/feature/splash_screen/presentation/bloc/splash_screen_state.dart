part of 'splash_screen_bloc.dart';

@freezed
class SplashScreenState with _$SplashScreenState {
  const factory SplashScreenState.loading() = _Loading;

  const factory SplashScreenState.error() = _Error;

  const factory SplashScreenState.success() = _Success;
}
