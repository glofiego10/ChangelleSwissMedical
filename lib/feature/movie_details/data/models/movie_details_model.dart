import 'package:challenge_swiss/feature/movie_details/domain/entity/movie_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_details_model.g.dart';

@JsonSerializable()
class MovieDetailsModel extends MovieDetails {
  MovieDetailsModel({
    required int id,
    required String title,
    required String posterPath,
    required String overview,
    required double rating,
    required String releaseDate,
    required int runtime,
    required List<String> genres,
  }) : super(
          id: id,
          title: title,
          posterPath: posterPath,
          overview: overview,
          rating: rating,
          releaseDate: releaseDate,
          runtime: runtime,
          genres: genres,
        );

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    final genreNames = (json['genres'] as List)
        // ignore: avoid_dynamic_calls
        .map((genre) => genre['name'] as String)
        .toList();

    return MovieDetailsModel(
      id: json['id'],
      title: json['title'],
      posterPath: json['backdrop_path'],
      overview: json['overview'],
      rating: json['vote_average'],
      releaseDate: json['release_date'],
      runtime: json['runtime'],
      genres: genreNames,
    );
  }

  Map<String, dynamic> toJson() => _$MovieDetailsModelToJson(this);
}
