import 'package:spotify_flutter/domain/entities/entities.dart';

class LocalSongModel {
  String artist;
  String title;
  int lengthInSeconds;
  String albumImageUrl;

  LocalSongModel({
    required this.artist,
    required this.title,
    required this.lengthInSeconds,
    required this.albumImageUrl,
  });

  factory LocalSongModel.fromJson(Map<String, dynamic> json) => LocalSongModel(
        artist: json["artist"],
        title: json["title"],
        lengthInSeconds: json["lengthInSeconds"],
        albumImageUrl: json["albumImageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "artist": artist,
        "title": title,
        "lengthInSeconds": lengthInSeconds,
        "albumImageUrl": albumImageUrl,
      };

  Song toSongEntity() => Song(
        artist: artist,
        title: title,
        lengthInSeconds: lengthInSeconds,
        albumImageUrl: albumImageUrl,
      );
}
