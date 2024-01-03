import 'dart:convert';

List<GetAllReclamationRes> getAllReclamationResFromJson(String str) =>
    List<GetAllReclamationRes>.from(
        json.decode(str).map((x) => GetAllReclamationRes.fromJson(x)));

String getAllReclamationResToJson(List<GetAllReclamationRes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllReclamationRes {
  final String id;
  final String tittre;
  final String description;
  final bool statue;
  final DateTime createdAt;
  final DateTime updatedAt;

  GetAllReclamationRes({
    required this.id,
    required this.tittre,
    required this.description,
    required this.statue,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GetAllReclamationRes.fromJson(Map<String, dynamic> json) =>
      GetAllReclamationRes(
        id: json["_id"],
        tittre: json["tittre"],
        description: json["description"],
        statue: json["statue"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "tittre": tittre,
        "description": description,
        "statue": statue,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
