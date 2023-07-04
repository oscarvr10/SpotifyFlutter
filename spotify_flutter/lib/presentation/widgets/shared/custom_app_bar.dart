import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final List<Widget> actions;
  final Widget child;
  final String appBarTitle;
  final double appBarHeight;

  const CustomAppBar({
    super.key,
    required this.actions,
    required this.child,
    required this.appBarTitle,
    this.appBarHeight = 110,
  });

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
        expandedHeight: appBarHeight,
        collapsedHeight: 48,
        toolbarHeight: 48,
        title: Text(
          appBarTitle,
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
          child: child,
        ),
        actions: actions);
  }
}
