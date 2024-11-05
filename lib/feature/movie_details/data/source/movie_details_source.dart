import 'package:challenge_swiss/core/config/app_api_endpoint.dart';
import 'package:challenge_swiss/feature/movie_details/data/models/movie_details_model.dart';
import 'package:challenge_swiss/shared/data/network/custom_http_client.dart';
import 'package:challenge_swiss/shared/data/network/reques_base.dart';

abstract class MovieDetailsSource {
  Future<MovieDetailsModel?> getDetailsMovie(
    int id, {
    String? language = 'es-ES',
  });
}

class MovieDetailsSourceImpl implements MovieDetailsSource {
  final _baseUrl = Uri.parse(ApiEndponit.baseUrl + ApiEndponit.movies);
  final httpClient = CustomHttpClient();
  final requestBase = RequestBase();

  @override
  Future<MovieDetailsModel?> getDetailsMovie(
    int id, {
    String? language = 'es-ES',
  }) async {
    final uri = Uri.parse('$_baseUrl/$id').replace(
      queryParameters: {
        'language': language,
      },
    );

    final response = await requestBase.call<MovieDetailsModel>(
      functionUrl: () => httpClient.get(uri),
      mapping: (data) => MovieDetailsModel.fromJson(data),
    );

    return response.data;
  }
}
