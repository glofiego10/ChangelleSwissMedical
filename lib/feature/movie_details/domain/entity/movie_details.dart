class MovieDetails {
  MovieDetails({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.rating,
    required this.releaseDate,
    required this.runtime,
    required this.genres,
  });
  final int id;
  final String title;
  final String posterPath;
  final String overview;
  final double rating;
  final String releaseDate;
  final int runtime;
  final List<String> genres;
}
