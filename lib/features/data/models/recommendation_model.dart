// To parse this JSON data, do
//
//     final recommendationModel = recommendationModelFromJson(jsonString);

import 'dart:convert';

RecommendationModel recommendationModelFromJson(String str) => RecommendationModel.fromJson(json.decode(str));

String recommendationModelToJson(RecommendationModel data) => json.encode(data.toJson());

class RecommendationModel {
  int page;
  List<Result> results;

  RecommendationModel({
    required this.page,
    required this.results,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) => RecommendationModel(
    page: json["page"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  String? backdropPath;
  int id;
  String title;

  Result({
     this.backdropPath,
    required this.id,
    required this.title,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    backdropPath: json["backdrop_path"]!=null?json["backdrop_path"]:null,
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "backdrop_path": backdropPath,
    "id": id,
    "title": title,
  };
}
