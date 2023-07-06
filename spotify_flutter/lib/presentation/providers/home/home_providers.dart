import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_flutter/domain/entities/entities.dart';
import 'package:spotify_flutter/presentation/providers/mock_data_provider.dart';

final recentPlayedProvider =
    StateNotifierProvider<MockRecentNotifier, List<Recent>>((ref) {
  final fetchRecentList = ref.read(mockRepositoryProvider).getRecents;

  return MockRecentNotifier(fetchRecents: fetchRecentList);
});

final playlistProvider =
    StateNotifierProvider<MockPlaylistNotifier, List<Playlist>>((ref) {
  final fetchPlaylists = ref.read(mockRepositoryProvider).getPlaylists;

  return MockPlaylistNotifier(fetchPlaylists: fetchPlaylists);
});

final recommendationsProvider =
    StateNotifierProvider<MockRecommendationsNotifier, List<Album>>((ref) {
  final fetchRecommendations = ref.read(mockRepositoryProvider).getAlbums;

  return MockRecommendationsNotifier(
      fetchRecommendations: fetchRecommendations);
});

final artistsProvider =
    StateNotifierProvider<MockArtistsNotifier, List<Artist>>((ref) {
  final fetchArtists = ref.read(mockRepositoryProvider).getArtists;

  return MockArtistsNotifier(fetchArtists: fetchArtists);
});

typedef RecentCallback = Future<List<Recent>> Function();

class MockRecentNotifier extends StateNotifier<List<Recent>> {
  bool isLoading = false;
  RecentCallback fetchRecents;

  MockRecentNotifier({
    required this.fetchRecents,
  }) : super([]);

  Future<void> loadItems() async {
    if (isLoading) return;

    isLoading = true;

    final List<Recent> recents = await fetchRecents();
    state = recents;
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}

typedef PlaylistCallback = Future<List<Playlist>> Function();

class MockPlaylistNotifier extends StateNotifier<List<Playlist>> {
  bool isLoading = false;
  PlaylistCallback fetchPlaylists;

  MockPlaylistNotifier({
    required this.fetchPlaylists,
  }) : super([]);

  Future<void> loadItems() async {
    if (isLoading) return;

    isLoading = true;

    final List<Playlist> playlists = await fetchPlaylists();
    state = playlists;
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}

typedef RecommendationsCallback = Future<List<Album>> Function();

class MockRecommendationsNotifier extends StateNotifier<List<Album>> {
  bool isLoading = false;
  RecommendationsCallback fetchRecommendations;

  MockRecommendationsNotifier({
    required this.fetchRecommendations,
  }) : super([]);

  Future<void> loadItems() async {
    if (isLoading) return;

    isLoading = true;

    final List<Album> albums = await fetchRecommendations();
    state = albums;
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}

typedef ArtistsCallback = Future<List<Artist>> Function();

class MockArtistsNotifier extends StateNotifier<List<Artist>> {
  bool isLoading = false;
  ArtistsCallback fetchArtists;

  MockArtistsNotifier({
    required this.fetchArtists,
  }) : super([]);

  Future<void> loadItems() async {
    if (isLoading) return;

    isLoading = true;

    final List<Artist> albums = await fetchArtists();
    state = albums;
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}
