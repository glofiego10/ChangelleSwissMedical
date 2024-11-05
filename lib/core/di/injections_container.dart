import 'package:challenge_swiss/feature/movie_details/data/repo/movie_details_repo_impl.dart';
import 'package:challenge_swiss/feature/movie_details/data/source/movie_details_source.dart';
import 'package:challenge_swiss/feature/movie_details/domain/repo/movie_details_repo.dart';
import 'package:challenge_swiss/shared/data/repo/repo_movie_impl.dart';
import 'package:challenge_swiss/shared/data/source/movie_local_data_source.dart';
import 'package:challenge_swiss/shared/data/source/movie_remote_data_source.dart';
import 'package:challenge_swiss/shared/domain/repo/repo_movie.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

Future<void> initDI() async {
  di

    //* Repositories
    ..registerLazySingleton<MovieDetailsRepositoy>(
      () => MovieDetailsRepositoyImpl(movieDetailsSource: di()),
    )
    ..registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(localDataSource: di(), remoteDataSource: di()),
    )

    //* Sources
    ..registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(),
    )
    ..registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(),
    )
    ..registerLazySingleton<MovieDetailsSource>(
      () => MovieDetailsSourceImpl(),
    );
}
