import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:spotify_flutter/presentation/providers/home/home_providers.dart';
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
    final size = MediaQuery.of(context).size;
    final fontStyle = Theme.of(context).textTheme;

    final actions = <Widget>[
      const Icon(FluentIcons.alert_20_regular, size: 28.0),
      SizedBox(width: size.width * 0.055),
      const Icon(FluentIcons.history_20_regular, size: 28.0),
      SizedBox(width: size.width * 0.055),
      const Icon(FluentIcons.settings_20_regular, size: 28.0),
      const SizedBox(width: 12.0),
    ];

    return CustomScrollView(
      slivers: [
        CustomAppBar(
          actions: actions,
          appBarTitle: 'Good Evening',
          child: categories(fontStyle),
        ),
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

  Widget categories(TextTheme fontStyle) {
    return Container(
      color: const Color.fromRGBO(18, 18, 18, 1.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          Chip(
            label: const Text('Music'),
            labelStyle: fontStyle.labelSmall!.copyWith(color: Colors.white),
            backgroundColor: const Color.fromRGBO(42, 42, 42, 1.0),
            surfaceTintColor: const Color.fromRGBO(42, 42, 42, 1.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(width: 12.0),
          Chip(
            label: const Text('Podcasts & Shows'),
            labelStyle: fontStyle.labelSmall!.copyWith(color: Colors.white),
            backgroundColor: const Color.fromRGBO(42, 42, 42, 1.0),
            surfaceTintColor: const Color.fromRGBO(42, 42, 42, 1.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
