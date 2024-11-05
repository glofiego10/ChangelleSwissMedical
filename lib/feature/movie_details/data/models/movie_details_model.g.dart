// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsModel _$MovieDetailsModelFromJson(Map<String, dynamic> json) =>
    MovieDetailsModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      posterPath: json['backdrop_path'] as String,
      overview: json['overview'] as String,
      rating: (json['vote_average'] as num).toDouble(),
      releaseDate: json['release_date'] as String,
      runtime: (json['runtime'] as num).toInt(),
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$MovieDetailsModelToJson(MovieDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'backdrop_path': instance.posterPath,
      'overview': instance.overview,
      'vote_average': instance.rating,
      'release_date': instance.releaseDate,
      'runtime': instance.runtime,
      'genres': instance.genres,
    };
