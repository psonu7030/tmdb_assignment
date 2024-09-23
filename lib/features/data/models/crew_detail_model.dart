// To parse this JSON data, do
//
//     final crewDetailModel = crewDetailModelFromJson(jsonString);

import 'dart:convert';

CrewDetailModel crewDetailModelFromJson(String str) => CrewDetailModel.fromJson(json.decode(str));

String crewDetailModelToJson(CrewDetailModel data) => json.encode(data.toJson());

class CrewDetailModel {
  int id;
  // List<Cast> cast;
  List<Cast> crew;

  CrewDetailModel({
    required this.id,
    // required this.cast,
    required this.crew,
  });

  factory CrewDetailModel.fromJson(Map<String, dynamic> json) => CrewDetailModel(
    id: json["id"],
    crew: List<Cast>.from(json["crew"].map((x) => Cast.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "crew": List<dynamic>.from(crew.map((x) => x.toJson())),
  };
}

class Cast {
  bool adult;
  int gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;


  Cast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,

  });

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
    adult: json["adult"],
    gender: json["gender"],
    id: json["id"],
    knownForDepartment: json["known_for_department"],
    name: json["name"],
    originalName: json["original_name"],

  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "gender": gender,
    "id": id,
    "known_for_department": knownForDepartment,
    "name": name,
    "original_name": originalName,

  };
}
