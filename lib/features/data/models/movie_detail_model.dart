// To parse this JSON data, do
//
//     final movieDetailModel = movieDetailModelFromJson(jsonString);

import 'dart:convert';

MovieDetailModel movieDetailModelFromJson(String str) =>
    MovieDetailModel.fromJson(json.decode(str));

String movieDetailModelToJson(MovieDetailModel data) =>
    json.encode(data.toJson());

class MovieDetailModel {
  bool adult;
  String backdropPath;


  String homepage;
  int id;
  String imdbId;

  String originalTitle;
  String overview;

  String posterPath;

  String releaseDate;

  int runtime;

  String tagline;
  String title;

  double voteAverage;
  int voteCount;

  MovieDetailModel({
    required this.adult,
    required this.backdropPath,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.runtime,
    required this.tagline,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],

        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        originalTitle: json["original_title"],
        overview: json["overview"],

        posterPath: json["poster_path"],
        releaseDate: json["release_date"],

        runtime: json["runtime"],

        tagline: json["tagline"],
        title: json["title"],

        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,

        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "original_title": originalTitle,
        "overview": overview,

        "poster_path": posterPath,
        "release_date": releaseDate,

        "runtime": runtime,

        "tagline": tagline,
        "title": title,

        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}

class Genre {
  int id;
  String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

