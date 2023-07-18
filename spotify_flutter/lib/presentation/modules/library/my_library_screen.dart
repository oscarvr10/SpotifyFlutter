import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_flutter/presentation/providers/home/home_providers.dart';
import 'package:spotify_flutter/presentation/widgets/library/custom_list_tile.dart';
import 'package:spotify_flutter/presentation/widgets/shared/shared.dart';

class MyLibraryScreen extends ConsumerStatefulWidget {
  const MyLibraryScreen({super.key});

  @override
  MyLibraryScreenState createState() => MyLibraryScreenState();
}

class MyLibraryScreenState extends ConsumerState<MyLibraryScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    ref.read(playlistProvider.notifier).loadItems();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final playlists = ref.watch(playlistProvider);
    final size = MediaQuery.of(context).size;

    final actions = <Widget>[
      const Icon(FluentIcons.search_32_regular, size: 28.0),
      SizedBox(width: size.width * 0.055),
      const Icon(FluentIcons.add_32_regular, size: 28.0),
      const SizedBox(width: 12.0),
    ];

    return Container(
      padding: const EdgeInsets.only(bottom: 120),
      child: CustomScrollView(
        slivers: [
          CustomAppBar(
            actions: actions,
            appBarTitle: 'Your Library',
            showAvatar: true,
            appBarHeight: 135,
            child: categories(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  padding: const EdgeInsets.all(12.0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(FluentIcons.arrow_sort_20_regular, size: 16),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Text(
                          'Recently played',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                      Icon(FluentIcons.grid_20_regular, size: 16),
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (playlists.isEmpty) {
                  return Container();
                }

                return CustomListTile(
                  imageUrl: playlists[index].imageUrl,
                  subtitle: playlists[index].editor,
                  title: playlists[index].name,
                );
              },
              childCount: playlists.length,
            ),
          )
        ],
      ),
    );
  }

  Widget categories() {
    return Container(
      color: const Color.fromRGBO(18, 18, 18, 1.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: const Row(
        children: [
          CustomChip(text: 'Playlist'),
          SizedBox(width: 12.0),
          CustomChip(text: 'Podcasts & Shows'),
          SizedBox(width: 12.0),
          CustomChip(text: 'Albums'),
          SizedBox(width: 12.0),
          CustomChip(text: 'Artists'),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
