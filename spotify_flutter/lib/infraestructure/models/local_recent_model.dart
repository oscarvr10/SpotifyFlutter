import 'package:spotify_flutter/domain/entities/entities.dart';

class LocalRecentModel {
  String description;
  String imageUrl;

  LocalRecentModel({
    required this.description,
    required this.imageUrl,
  });

  factory LocalRecentModel.fromJson(Map<String, dynamic> json) =>
      LocalRecentModel(
        description: json["description"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "imageUrl": imageUrl,
      };

  Recent toRecentEntity() => Recent(
        description: description,
        imageUrl: imageUrl,
      );
}
