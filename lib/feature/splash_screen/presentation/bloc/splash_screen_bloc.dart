import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';
part 'splash_screen_bloc.freezed.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(const _Loading()) {
    on<SplashScreenEvent>((event, emit) {
      event.when(
        success: () {
          if (state is _Success) return;

          emit(const _Success());
        },
        error: () {
          if (state is _Error) return;

          emit(const _Error());
        },
      );
    });
  }
}
