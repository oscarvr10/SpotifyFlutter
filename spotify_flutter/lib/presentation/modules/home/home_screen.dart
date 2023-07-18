import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:spotify_flutter/presentation/providers/home/home_providers.dart';
import 'package:spotify_flutter/presentation/widgets/home/home.dart';
import 'package:spotify_flutter/presentation/widgets/shared/custom_app_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_flutter/presentation/widgets/shared/custom_chip.dart';

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
          appBarTitle: 'Good Morning',
          appBarHeight: 135,
          child: categories(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (artists.isEmpty) {
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
                    headerText: 'Popular Artists',
                    artists: artists,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.17),
                ],
              );
            },
            childCount: 1,
          ),
        )
      ],
    );
  }

  Widget categories() {
    return Container(
      color: const Color.fromRGBO(18, 18, 18, 1.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: const Row(
        children: [
          CustomChip(text: 'Music'),
          SizedBox(width: 12.0),
          CustomChip(text: 'Podcasts & Shows'),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
