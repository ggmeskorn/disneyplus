class Tv {
  final String posterPath;
  final double popularity;
  final int id;
  final String backdropPath;
  final String voteAverage;
  final String overview;
  final String firstairdate;
  final String originalLanguage;
  final String originalName;
  final String name;
  final int voteCount;

  String error;

  Tv({
    this.backdropPath,
    this.firstairdate,
    this.id,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.name,
    this.voteCount,
    this.voteAverage,
  });

  factory Tv.fromJson(dynamic json) {
    if (json == null) {
      return Tv();
    }

    return Tv(
        backdropPath: json['backdrop_path'],
        id: json['id'],
        originalLanguage: json['original_language'],
        originalName: json['original_name'],
        overview: json['overview'],
        popularity: json['popularity'],
        posterPath: json['poster_path'],
        firstairdate: json['first_air_date'],
        name: json['name'],
        voteCount: json['vote_count'],
        voteAverage: json['vote_average'].toString());
  }
}
