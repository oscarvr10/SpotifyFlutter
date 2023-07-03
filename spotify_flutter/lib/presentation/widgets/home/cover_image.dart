import 'package:flutter/material.dart';

class CoverImage extends StatelessWidget {
  final String imageUrl;
  final String? title;
  final String? description;

  const CoverImage({
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
        width: 150.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 150,
              width: 150,
            ),
            if (title != null)
              Container(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  title!,
                  style: bodyTheme.bodySmall!.copyWith(color: Colors.white),
                  maxLines: 2,
                ),
              ),
            if (description != null)
              Container(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Text(
                  description!,
                  style: bodyTheme.bodySmall!.copyWith(color: Colors.grey),
                  maxLines: 2,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
