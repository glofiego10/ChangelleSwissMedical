import 'package:challenge_swiss/shared/domain/entity/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMovies({
    required String category,
    int? page,
    String? language,
  });
}
