import 'package:auto_route/auto_route.dart';
import 'package:challenge_swiss/core/routes/app_routes.dart';
import 'package:challenge_swiss/feature/home/presentation/view/home_view.dart';
import 'package:challenge_swiss/feature/movie_details/presentation/view/movie_details_view.dart';
import 'package:challenge_swiss/feature/splash_screen/presentation/view/splash_screen_view.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          initial: true,
          path: AppRoutes.splashscreen,
          page: SplashRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          path: AppRoutes.home,
          page: HomeRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          path: AppRoutes.details,
          page: MovieDetailsRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
      ];
}
