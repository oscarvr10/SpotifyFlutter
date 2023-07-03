import 'package:flutter/material.dart';
import 'package:spotify_flutter/presentation/providers/mock_providers.dart';
import 'package:spotify_flutter/presentation/widgets/home/playlist_list_view.dart';
import 'package:spotify_flutter/presentation/widgets/home/popular_artists_list_view.dart';
import 'package:spotify_flutter/presentation/widgets/home/recommendations_list_view.dart';
import 'package:spotify_flutter/presentation/widgets/shared/custom_app_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_flutter/presentation/widgets/home/recent_list_view.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    ref.read(recentPlayedProvider.notifier).loadItems();
    ref.read(playlistProvider.notifier).loadItems();
    ref.read(recommendationsProvider.notifier).loadItems();
    ref.read(artistsProvider.notifier).loadItems();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final recentPlayedList = ref.watch(recentPlayedProvider);
    final playlists = ref.watch(playlistProvider);
    final albums = ref.watch(recommendationsProvider);
    final artists = ref.watch(artistsProvider);

    return CustomScrollView(
      slivers: [
        const CustomAppBar(),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (recentPlayedList.isEmpty && playlists.isEmpty) {
                return Container();
              }
              return Column(
                children: [
                  RecentListView(recentPlayedList: recentPlayedList),
                  PlaylistListView(
                    headerText: 'Made for You',
                    playlists: playlists,
                  ),
                  RecommendationsListView(
                    headerText: 'Recommendations',
                    recommendations: albums,
                  ),
                  PopularArtistsListView(
                      headerText: 'Popular Artists', artists: artists)
                ],
              );
            },
            childCount: 1,
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
