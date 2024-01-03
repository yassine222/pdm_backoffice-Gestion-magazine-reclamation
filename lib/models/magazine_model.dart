import 'dart:convert';

List<GetAllMagazineRes> getAllMagazineResFromJson(String str) =>
    List<GetAllMagazineRes>.from(
        json.decode(str).map((x) => GetAllMagazineRes.fromJson(x)));

String getAllMagazineResToJson(List<GetAllMagazineRes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllMagazineRes {
  final String id;
  final String titre;
  final String type;
  final String videoUrl;
  final String description;
  final DateTime createdAt;

  GetAllMagazineRes({
    required this.id,
    required this.titre,
    required this.type,
    required this.videoUrl,
    required this.description,
    required this.createdAt,
  });

  factory GetAllMagazineRes.fromJson(Map<String, dynamic> json) =>
      GetAllMagazineRes(
        id: json["_id"],
        titre: json["titre"],
        type: json["type"],
        videoUrl: json["videoUrl"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "titre": titre,
        "type": type,
        "videoUrl": videoUrl,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
      };
}
