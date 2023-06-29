import 'package:spotify_flutter/domain/entities/entities.dart';

class LocalArtistModel {
  String name;
  String imageUrl;

  LocalArtistModel({
    required this.name,
    required this.imageUrl,
  });

  factory LocalArtistModel.fromJson(Map<String, dynamic> json) =>
      LocalArtistModel(
        name: json["name"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "imageUrl": imageUrl,
      };

  Artist toArtistEntity() => Artist(
        name: name,
        imageUrl: imageUrl,
      );
}
