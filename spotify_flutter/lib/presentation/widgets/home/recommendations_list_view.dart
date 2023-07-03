import 'package:flutter/material.dart';
import 'package:spotify_flutter/domain/entities/entities.dart';
import 'package:spotify_flutter/presentation/widgets/home/cover_image.dart';

class RecommendationsListView extends StatelessWidget {
  final String headerText;
  final List<Album> recommendations;

  const RecommendationsListView({
    super.key,
    required this.headerText,
    required this.recommendations,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge!;

    return Container(
      padding: const EdgeInsets.only(left: 12.0),
      height: 280,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Text(
            headerText,
            textAlign: TextAlign.right,
            style: titleStyle.copyWith(
                fontWeight: FontWeight.w700, color: Colors.white),
          ),
          const SizedBox(height: 18),
          Expanded(
            child: ListView.builder(
              itemCount: recommendations.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return CoverImage(
                  imageUrl: recommendations[index].imageUrl,
                  title: recommendations[index].name,
                  description: recommendations[index].artist,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
