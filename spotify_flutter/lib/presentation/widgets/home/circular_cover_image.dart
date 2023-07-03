import 'package:flutter/material.dart';

class CircularCoverImage extends StatelessWidget {
  final String imageUrl;
  final String? title;
  final String? description;

  const CircularCoverImage({
    super.key,
    required this.imageUrl,
    this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    final bodyTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.only(right: 18.0),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 75.0,
            ),
            const SizedBox(height: 8.0),
            if (title != null)
              Text(
                title!,
                style: bodyTheme.bodySmall!.copyWith(color: Colors.white),
                maxLines: 1,
              ),
            if (description != null)
              Text(
                description!,
                style: bodyTheme.bodySmall!.copyWith(color: Colors.grey),
                maxLines: 1,
              ),
          ],
        ),
      ),
    );
  }
}
