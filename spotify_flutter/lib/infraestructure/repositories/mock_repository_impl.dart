import 'package:spotify_flutter/domain/datasources/mock_datasource.dart';
import 'package:spotify_flutter/domain/entities/album.dart';
import 'package:spotify_flutter/domain/entities/artist.dart';
import 'package:spotify_flutter/domain/entities/playlist.dart';
import 'package:spotify_flutter/domain/entities/recent.dart';
import 'package:spotify_flutter/domain/entities/search_category.dart';
import 'package:spotify_flutter/domain/entities/song.dart';
import 'package:spotify_flutter/domain/repositories/mock_repository.dart';

class MockRepositoryImpl implements MockRepository {
  final MockDataSource dataSource;

  MockRepositoryImpl(
    this.dataSource,
  );

  @override
  Future<List<Album>> getAlbums() {
    return dataSource.getAlbums();
  }

  @override
  Future<List<Artist>> getArtists() {
    return dataSource.getArtists();
  }

  @override
  Future<List<Playlist>> getPlaylists() {
    return dataSource.getPlaylists();
  }

  @override
  Future<List<Recent>> getRecents() {
    return dataSource.getRecents();
  }

  @override
  Future<List<SearchCategory>> getSearchCategories() {
    return dataSource.getSearchCategories();
  }

  @override
  Future<List<Song>> getSongs() {
    return dataSource.getSongs();
  }
}
