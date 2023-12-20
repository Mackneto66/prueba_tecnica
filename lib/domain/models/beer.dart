import 'dart:convert';

List<Beers> beersFromJson(String str) {
  final List<dynamic> parsedJson = json.decode(str);
  return List<Beers>.from(parsedJson.map((x) => Beers.fromJson(x)));
}

String beersToJson(List<Beers> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Beers {
  final int id;
  final String name;
  final String tagline;
  final String description;
  final String imageUrl;

  Beers({
    required this.id,
    required this.name,
    required this.tagline,
    required this.description,
    required this.imageUrl,
  });

  factory Beers.fromJson(Map<String, dynamic> json) => Beers(
        id: json["id"],
        name: json["name"],
        tagline: json["tagline"],
        description: json["description"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tagline": tagline,
        "description": description,
        "image_url": imageUrl,
      };
}

