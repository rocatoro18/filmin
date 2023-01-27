// To parse this JSON data, do
//
//     final creditsResponse = creditsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:filmin/models/models.dart';

class CreditsResponse {
  CreditsResponse({
    required this.id,
    required this.cast,
    required this.crew,
  });

  int id;
  List<Cast> cast;
  List<Cast> crew;

  factory CreditsResponse.fromJson(String str) =>
      CreditsResponse.fromMap(json.decode(str));

  factory CreditsResponse.fromMap(Map<String, dynamic> json) => CreditsResponse(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromMap(x))),
        crew: List<Cast>.from(json["crew"].map((x) => Cast.fromMap(x))),
      );
}

// class CreditsResponse {
//   CreditsResponse({
//     required this.id,
//     required this.cast,
//     required this.crew,
//   });

//   int id;
//   List<Cast> cast;
//   List<Cast> crew;

//   factory CreditsResponse.fromRawJson(String str) =>
//       CreditsResponse.fromJson(json.decode(str));

//   //String toRawJson() => json.encode(toJson());

//   factory CreditsResponse.fromJson(Map<String, dynamic> json) =>
//       CreditsResponse(
//         id: json["id"],
//         cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
//         crew: List<Cast>.from(json["crew"].map((x) => Cast.fromJson(x))),
//       );

//   /*
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
//         "crew": List<dynamic>.from(crew.map((x) => x.toJson())),
//       };
//   */
// }
