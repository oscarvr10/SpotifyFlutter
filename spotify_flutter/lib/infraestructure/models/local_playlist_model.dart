import 'package:spotify_flutter/domain/entities/entities.dart';

class LocalPlaylistModel {
  String name;
  int followers;
  String editor;
  String imageUrl;

  LocalPlaylistModel({
    required this.name,
    required this.followers,
    required this.editor,
    required this.imageUrl,
  });

  factory LocalPlaylistModel.fromJson(Map<String, dynamic> json) =>
      LocalPlaylistModel(
        name: json["name"],
        followers: json["followers"],
        editor: json["editor"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "followers": followers,
        "editor": editor,
        "imageUrl": imageUrl,
      };

  Playlist toPlaylistEntity() => Playlist(
        name: name,
        followers: followers,
        editor: editor,
        imageUrl: imageUrl,
      );
}
