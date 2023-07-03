import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fontStyle = Theme.of(context).textTheme;

    return SliverAppBar(
      foregroundColor: Colors.white,
      backgroundColor: Colors.black,
      centerTitle: false,
      pinned: true,
      floating: true,
      expandedHeight: 110,
      collapsedHeight: 48,
      toolbarHeight: 48,
      title: Text(
        'Good Evening',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: fontStyle.titleLarge!.fontSize,
          color: Colors.white,
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Container(
          width: double.infinity,
          color: const Color.fromRGBO(18, 18, 18, 1.0),
          // decoration: const BoxDecoration(
          //   gradient: RadialGradient(
          //     center: Alignment(-1.0, -1.0),
          //     radius: 2.0,
          //     // colors for gradient
          //     colors: [
          //       Color.fromARGB(255, 75, 80, 70),
          //       Colors.black,
          //       // Color.fromRGBO(59, 20, 202, 1.0),
          //       // Color.fromRGBO(86, 92, 115, 1.0),
          //     ],
          //   ),
          // ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size(size.width, 0),
        child: Container(
          color: const Color.fromRGBO(18, 18, 18, 1.0),
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            children: [
              Chip(
                label: const Text('Music'),
                labelStyle: fontStyle.labelSmall!.copyWith(color: Colors.white),
                backgroundColor: const Color.fromRGBO(42, 42, 42, 1.0),
                surfaceTintColor: const Color.fromRGBO(42, 42, 42, 1.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(width: 12.0),
              Chip(
                label: const Text('Podcasts & Shows'),
                labelStyle: fontStyle.labelSmall!.copyWith(color: Colors.white),
                backgroundColor: const Color.fromRGBO(42, 42, 42, 1.0),
                surfaceTintColor: const Color.fromRGBO(42, 42, 42, 1.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        const Icon(FluentIcons.alert_20_regular, size: 28.0),
        SizedBox(width: size.width * 0.055),
        const Icon(FluentIcons.history_20_regular, size: 28.0),
        SizedBox(width: size.width * 0.055),
        const Icon(FluentIcons.settings_20_regular, size: 28.0)
      ],
    );
  }
}
