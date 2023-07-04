import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_flutter/presentation/providers/search/search_providers.dart';
import 'package:spotify_flutter/presentation/widgets/search/search.dart';
import 'package:spotify_flutter/presentation/widgets/shared/custom_app_bar.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends ConsumerState<SearchScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    ref.read(searchCategoryProvider.notifier).loadItems();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final categories = ref.watch(searchCategoryProvider);
    final textStyle = Theme.of(context).textTheme;

    final actions = <Widget>[
      const Icon(FluentIcons.camera_28_regular, size: 28.0),
      const SizedBox(width: 12.0),
    ];

    return CustomScrollView(
      slivers: [
        CustomAppBar(
          actions: actions,
          appBarTitle: 'Search',
          child: Container(
            padding: const EdgeInsets.only(left: 14.0, right: 14.0),
            child: const CustomSearchBar(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (categories.isEmpty) {
                return Container();
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 14.0, top: 24.0),
                    child: Text(
                      'Explore all',
                      style: textStyle.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                  CategoryGridView(categories: categories),
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
