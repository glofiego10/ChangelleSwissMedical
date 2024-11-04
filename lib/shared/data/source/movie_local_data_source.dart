import 'package:challenge_swiss/shared/data/models/movie_model.dart';
import 'package:hive/hive.dart';

abstract class MovieLocalDataSource {
  Future<void> cacheMovies(String category, List<MovieModel> movies);
  Future<List<MovieModel>> getCachedMovies(String category);
}

class MovieLocalDataSourceImpl implements MovieLocalDataSource {
  @override
  Future<void> cacheMovies(String category, List<MovieModel> newMovies) async {
    final box = await Hive.openBox<MovieModel>(category);

    final oldMovies = box.values.toList();
    final moviesToAdd = _filterNewMovies(oldMovies, newMovies);

    if (moviesToAdd.isNotEmpty) {
      await box.addAll(moviesToAdd);
    }
  }

  @override
  Future<List<MovieModel>> getCachedMovies(String category) async {
    final box = await Hive.openBox<MovieModel>(category);
    return box.values.toList();
  }

  List<MovieModel> _filterNewMovies(
    List<MovieModel> oldMovies,
    List<MovieModel> newMovies,
  ) {
    final existingIds = oldMovies.map((movie) => movie.id).toSet();
    return newMovies.where((movie) => !existingIds.contains(movie.id)).toList();
  }
}
