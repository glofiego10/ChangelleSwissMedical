import 'dart:io';

import 'package:challenge_swiss/core/extensions/string_extensions.dart';
import 'package:challenge_swiss/feature/movie_details/data/source/movie_details_source.dart';
import 'package:challenge_swiss/feature/movie_details/domain/entity/movie_details.dart';
import 'package:challenge_swiss/feature/movie_details/domain/repo/movie_details_repo.dart';

class MovieDetailsRepositoyImpl implements MovieDetailsRepositoy {
  MovieDetailsRepositoyImpl({
    required this.movieDetailsSource,
  });

  final MovieDetailsSource movieDetailsSource;

  @override
  Future<MovieDetails> getDetails(int id) async {
    final response = await movieDetailsSource.getDetailsMovie(id);

    if (response.isNull) {
      throw const HttpException('Pelicula no encontrada.');
    }

    return response!;
  }
}
