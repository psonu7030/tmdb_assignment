// To parse this JSON data, do
//
//     final movieYtDetailModel = movieYtDetailModelFromJson(jsonString);

import 'dart:convert';

MovieYtDetailModel movieYtDetailModelFromJson(String str) => MovieYtDetailModel.fromJson(json.decode(str));

String movieYtDetailModelToJson(MovieYtDetailModel data) => json.encode(data.toJson());

class MovieYtDetailModel {
  int id;
  List<Result> results;

  MovieYtDetailModel({
    required this.id,
    required this.results,
  });

  factory MovieYtDetailModel.fromJson(Map<String, dynamic> json) => MovieYtDetailModel(
    id: json["id"],
    results:json["results"] != null
        ? List<Result>.from(json["results"].map((x) => Result.fromJson(x)))
        : []
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  String name;
  String key;

  String id;

  Result({
    required this.name,
    required this.key,
    required this.id,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    name: json["name"],
    key: json["key"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "key": key,
    "id": id,
  };
}


