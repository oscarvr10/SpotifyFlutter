import 'package:spotify_flutter/domain/entities/album.dart';

class LocalAlbumModel {
  final String artist;
  final String name;
  final String imageUrl;

  LocalAlbumModel({
    required this.artist,
    required this.name,
    required this.imageUrl,
  });

  factory LocalAlbumModel.fromJson(Map<String, dynamic> json) =>
      LocalAlbumModel(
        artist: json["artist"],
        name: json["name"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "artist": artist,
        "name": name,
        "imageUrl": imageUrl,
      };

  Album toAlbumEntity() => Album(
        artist: artist,
        name: name,
        imageUrl: imageUrl,
      );
}
