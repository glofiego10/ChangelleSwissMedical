import 'package:auto_route/auto_route.dart';
import 'package:challenge_swiss/core/routes/app_routes.dart';
import 'package:challenge_swiss/feature/home/presentation/blocs/popular/popular_bloc.dart';
import 'package:challenge_swiss/feature/home/presentation/blocs/top_rated/top_rated_bloc.dart';
import 'package:challenge_swiss/feature/home/presentation/blocs/upcoming/upcoming_bloc.dart';
import 'package:challenge_swiss/feature/splash_screen/presentation/bloc/splash_screen_bloc.dart';
import 'package:challenge_swiss/shared/presentation/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    context.read<PopularBloc>().add(const PopularEvent.getMovies());
    context.read<UpcomingBloc>().add(const UpcomingEvent.getMovies());
    context.read<TopRatedBloc>().add(const TopRatedEvent.getMovies());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SplashScreenBloc>();

    return MultiBlocListener(
      listeners: [
        BlocListener<PopularBloc, PopularState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (list) {
                bloc.add(const SplashScreenEvent.success());
              },
              error: () => bloc.add(const SplashScreenEvent.error()),
            );
          },
        ),
        BlocListener<TopRatedBloc, TopRatedState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (list) {
                bloc.add(const SplashScreenEvent.success());
              },
              error: () => bloc.add(const SplashScreenEvent.error()),
            );
          },
        ),
        BlocListener<UpcomingBloc, UpcomingState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (list) {
                bloc.add(const SplashScreenEvent.success());
              },
              error: () => bloc.add(const SplashScreenEvent.error()),
            );
          },
        ),
      ],
      child: const SplashScreenView(),
    );
  }
}

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final router = context.router;

    return BlocConsumer<SplashScreenBloc, SplashScreenState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            router.navigateNamed(AppRoutes.home);
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: state.maybeWhen(
              loading: () => const LoadingIndicator(),
              error: () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, color: Colors.red, size: 60),
                  const SizedBox(height: 10),
                  const Text(
                    'Ocurrió un error. Intenta de nuevo.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<PopularBloc>()
                          .add(const PopularEvent.getMovies());
                      context
                          .read<UpcomingBloc>()
                          .add(const UpcomingEvent.getMovies());
                      context
                          .read<TopRatedBloc>()
                          .add(const TopRatedEvent.getMovies());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text('Reintentar'),
                  ),
                ],
              ),
              orElse: () => const SizedBox.shrink(),
            ),
          ),
        );
      },
    );
  }
}
