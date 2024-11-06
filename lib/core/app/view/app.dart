import 'package:challenge_swiss/core/di/injections_container.dart';
import 'package:challenge_swiss/core/routes/router.dart';
import 'package:challenge_swiss/feature/home/presentation/blocs/popular/popular_bloc.dart';
import 'package:challenge_swiss/feature/home/presentation/blocs/top_rated/top_rated_bloc.dart';
import 'package:challenge_swiss/feature/home/presentation/blocs/upcoming/upcoming_bloc.dart';
import 'package:challenge_swiss/feature/splash_screen/presentation/bloc/splash_screen_bloc.dart';
import 'package:challenge_swiss/l10n/l10n.dart';
import 'package:challenge_swiss/shared/presentation/widgets/scroll_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PopularBloc(movieRepo: di()),
        ),
        BlocProvider(
          create: (context) => TopRatedBloc(movieRepo: di()),
        ),
        BlocProvider(
          create: (context) => UpcomingBloc(movieRepo: di()),
        ),
        BlocProvider(
          create: (context) => SplashScreenBloc(),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Challenge Swiss',
      debugShowCheckedModeBanner: false,
    );
  }
}
