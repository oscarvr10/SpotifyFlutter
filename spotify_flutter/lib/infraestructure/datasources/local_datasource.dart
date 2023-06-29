import 'package:spotify_flutter/domain/datasources/mock_datasource.dart';
import 'package:spotify_flutter/domain/entities/album.dart';
import 'package:spotify_flutter/domain/entities/artist.dart';
import 'package:spotify_flutter/domain/entities/search_category.dart';
import 'package:spotify_flutter/domain/entities/playlist.dart';
import 'package:spotify_flutter/domain/entities/recent.dart';
import 'package:spotify_flutter/domain/entities/song.dart';
import 'package:spotify_flutter/infraestructure/models/models.dart';
import 'package:spotify_flutter/shared/data/spotify_data.dart';

class LocalDataSource implements MockDataSource {
  @override
  Future<List<Album>> getAlbums() async {
    await Future.delayed(const Duration(seconds: 2));
    final List<Album> newAlbums = albums
        .map((album) => LocalAlbumModel.fromJson(album).toAlbumEntity())
        .toList();

    return newAlbums;
  }

  @override
  Future<List<Artist>> getArtists() async {
    await Future.delayed(const Duration(seconds: 2));
    final List<Artist> newArtists = albums
        .map((artist) => LocalArtistModel.fromJson(artist).toArtistEntity())
        .toList();

    return newArtists;
  }

  @override
  Future<List<SearchCategory>> getSearchCategories() async {
    await Future.delayed(const Duration(seconds: 2));
    final List<SearchCategory> newCategories = searchCategories
        .map((category) => LocalSearchCategoryModel.fromJson(category)
            .toSearchCategoryEntity())
        .toList();

    return newCategories;
  }

  @override
  Future<List<Playlist>> getPlaylists() async {
    await Future.delayed(const Duration(seconds: 2));
    final List<Playlist> newPlaylists = playlists
        .map((playlist) =>
            LocalPlaylistModel.fromJson(playlist).toPlaylistEntity())
        .toList();

    return newPlaylists;
  }

  @override
  Future<List<Recent>> getRecents() async {
    await Future.delayed(const Duration(seconds: 2));
    final List<Recent> newRecents = recents
        .map((recent) => LocalRecentModel.fromJson(recent).toRecentEntity())
        .toList();

    return newRecents;
  }

  @override
  Future<List<Song>> getSongs() async {
    await Future.delayed(const Duration(seconds: 2));
    final List<Song> newSongs = songs
        .map((song) => LocalSongModel.fromJson(song).toSongEntity())
        .toList();

    return newSongs;
  }
}
