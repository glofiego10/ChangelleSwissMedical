import 'dart:io';

import 'package:challenge_swiss/shared/data/mapper_to_entity/movie_mapper.dart';
import 'package:challenge_swiss/shared/data/source/movie_local_data_source.dart';
import 'package:challenge_swiss/shared/data/source/movie_remote_data_source.dart';
import 'package:challenge_swiss/shared/domain/entity/movie.dart';
import 'package:challenge_swiss/shared/domain/repo/repo_movie.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  final MovieLocalDataSource localDataSource;
  final MovieRemoteDataSource remoteDataSource;

  @override
  Future<List<Movie>> getMovies({
    required String category,
    int? page,
    String? language,
  }) async {
    final List<Movie> moviesList = [];

    try {
      final response = await remoteDataSource.getMovies(
        category: category,
        page: page ?? 1,
        language: language ?? 'es-ES',
      );

      moviesList.addAll(
        response.map((model) => model.toEntity()).toList(),
      );

      await localDataSource.cacheMovies(category, response);
    } catch (error) {
      try {
        final cachedMovies = await localDataSource.getCachedMovies(category);

        moviesList.addAll(
          cachedMovies.map((model) => model.toEntity()).toList(),
        );
      } catch (cacheError) {
        throw HttpException('Error al buscar la categoria $category');
      }
    }

    return moviesList;
  }
}
