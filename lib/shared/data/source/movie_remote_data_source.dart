import 'package:challenge_swiss/core/config/app_api_endpoint.dart';
import 'package:challenge_swiss/shared/data/models/movie_model.dart';
import 'package:challenge_swiss/shared/data/network/custom_http_client.dart';
import 'package:challenge_swiss/shared/data/network/reques_base.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getMovies({
    required String category,
    int? page = 1,
    String? language = 'es-ES',
  });
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final _baseUrl = Uri.parse(ApiEndponit.baseUrl + ApiEndponit.movies);
  final httpClient = CustomHttpClient();
  final requestBase = RequestBase();

  @override
  Future<List<MovieModel>> getMovies({
    required String category,
    int? page = 1,
    String? language = 'es-ES',
  }) async {
    final uri = Uri.parse('$_baseUrl/$category').replace(
      queryParameters: {
        'page': page.toString(),
        'language': language,
      },
    );

    final response = await requestBase.call<List<MovieModel>>(
      functionUrl: () => httpClient.get(uri),
      mapping: (data) {
        final List<dynamic> jsonData = data['results'];
        return jsonData
            .map((item) => MovieModel.fromJson(item as Map<String, dynamic>))
            .toList();
      },
    );

    return response.data ?? [];
  }
}
