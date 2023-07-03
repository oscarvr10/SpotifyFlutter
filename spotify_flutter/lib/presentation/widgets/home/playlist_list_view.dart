import 'package:flutter/material.dart';
import 'package:spotify_flutter/domain/entities/entities.dart';
import 'package:spotify_flutter/presentation/widgets/home/cover_image.dart';

class PlaylistListView extends StatelessWidget {
  final String headerText;
  final List<Playlist> playlists;

  const PlaylistListView({
    super.key,
    required this.headerText,
    required this.playlists,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge!;

    return Container(
      padding: const EdgeInsets.only(left: 12.0, top: 12.0),
      height: 280,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Text(
            headerText,
            textAlign: TextAlign.right,
            style: titleStyle.copyWith(
                fontWeight: FontWeight.w700, color: Colors.white),
          ),
          const SizedBox(height: 18),
          Expanded(
            child: ListView.builder(
              itemCount: playlists.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return CoverImage(
                  imageUrl: playlists[index].imageUrl,
                  title: playlists[index].name,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
