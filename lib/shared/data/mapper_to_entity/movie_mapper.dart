import 'package:challenge_swiss/shared/data/models/movie_model.dart';
import 'package:challenge_swiss/shared/domain/entity/movie.dart';

extension MovieMapperExtension on MovieModel {
  Movie toEntity() {
    return Movie(
      id: id,
      title: title,
      posterPath: posterPath,
      overview: overview,
      rating: rating,
    );
  }
}
