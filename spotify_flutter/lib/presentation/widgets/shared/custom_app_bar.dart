import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final List<Widget> actions;
  final Widget child;
  final String appBarTitle;
  final double appBarHeight;
  final bool showAvatar;
  final bool isFixed;

  const CustomAppBar({
    super.key,
    required this.actions,
    required this.child,
    required this.appBarTitle,
    this.appBarHeight = 110,
    this.showAvatar = false,
    this.isFixed = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fontStyle = Theme.of(context).textTheme;

    return SliverAppBar(
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xFF121212),
      centerTitle: false,
      pinned: true,
      floating: true,
      expandedHeight: appBarHeight,
      collapsedHeight: isFixed ? appBarHeight : appBarHeight / 2.11,
      toolbarHeight: appBarHeight / 2.11,
      title: Container(
        padding: const EdgeInsets.only(top: 36.0),
        child: Row(
          children: [
            if (showAvatar)
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.blue.shade400,
                child: const Text(
                  'O',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            if (showAvatar) const SizedBox(width: 8),
            Text(
              appBarTitle,
              overflow: TextOverflow.ellipsis,
              style: fontStyle.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: -1.0),
            ),
          ],
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
        child: child,
      ),
      actions: [
        Container(
          padding: const EdgeInsets.only(top: 36.0),
          child: Row(children: actions),
        )
      ],
    );
  }
}
