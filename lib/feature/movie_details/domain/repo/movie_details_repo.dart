import 'package:challenge_swiss/feature/movie_details/domain/entity/movie_details.dart';

abstract class MovieDetailsRepositoy {
  Future<MovieDetails> getDetails(int id);
}
