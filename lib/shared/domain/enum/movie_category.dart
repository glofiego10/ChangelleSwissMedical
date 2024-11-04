enum MovieCategory {
  popular('popular', 'Popular'),
  topRated('top_rated', 'Mejor Valorados'),
  upcoming('upcoming', 'Proximamente');

  const MovieCategory(this.key, this.label);

  final String key;
  final String label;
}
