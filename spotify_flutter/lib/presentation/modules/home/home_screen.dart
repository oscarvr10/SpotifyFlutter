import 'package:flutter/material.dart';
import 'package:spotify_flutter/presentation/widgets/shared/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CustomAppBar(),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return const Column(
                children: [
                  Row(
                    children: [],
                  )
                ],
              );
            },
            childCount: 1,
          ),
        )
      ],
    );
  }
}
