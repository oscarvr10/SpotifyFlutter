import 'package:flutter/material.dart';
import 'package:spotify_flutter/domain/entities/entities.dart';
import 'package:spotify_flutter/presentation/widgets/home/circular_cover_image.dart';

class PopularArtistsListView extends StatelessWidget {
  final List<Artist> artists;
  final String headerText;

  const PopularArtistsListView({
    super.key,
    required this.artists,
    required this.headerText,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge!;

    return Container(
      padding: const EdgeInsets.only(left: 12.0),
      height: 240,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headerText,
            textAlign: TextAlign.right,
            style: titleStyle.copyWith(
                fontWeight: FontWeight.w700, color: Colors.white),
          ),
          const SizedBox(height: 28),
          Expanded(
            child: ListView.builder(
              itemCount: artists.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return CircularCoverImage(
                  imageUrl: artists[index].imageUrl,
                  title: artists[index].name,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
