import 'package:spotify_flutter/domain/entities/entities.dart';

abstract class MockDataSource {
  Future<List<Playlist>> getPlaylists();
  Future<List<Album>> getAlbums();
  Future<List<Song>> getSongs();
  Future<List<Artist>> getArtists();
  Future<List<SearchCategory>> getSearchCategories();
  Future<List<Recent>> getRecents();
}
