import 'package:flutter/material.dart';
import 'package:spotify_flutter/domain/entities/entities.dart';
import 'package:spotify_flutter/presentation/widgets/search/search.dart';

class CategoryGridView extends StatelessWidget {
  final List<SearchCategory> categories;
  const CategoryGridView({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 20, top: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 100,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CategoryCard(
          color: categories[index].backgroundColor,
          imageUrl: categories[index].imageUrl,
          name: categories[index].name,
        );
      },
    );
  }
}
