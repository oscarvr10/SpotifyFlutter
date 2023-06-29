import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_flutter/presentation/routes/routes.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
  });

  void onTabTapped(BuildContext context, int index) {
    if (index > 2 || index < 0) {
      context.go('${Routes.home}/0');
    } else {
      context.go('${Routes.home}/$index');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0.0,
      selectedItemColor: Colors.white,
      backgroundColor: Colors.transparent,
      currentIndex: currentIndex,
      onTap: (index) => onTabTapped(context, index),
      items: const [
        BottomNavigationBarItem(
            icon: Icon(FluentIcons.home_48_regular),
            activeIcon: Icon(FluentIcons.home_48_filled),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(FluentIcons.search_48_regular),
            activeIcon: Icon(FluentIcons.search_48_filled),
            label: 'Search'),
        BottomNavigationBarItem(
            icon: Icon(FluentIcons.library_28_regular),
            activeIcon: Icon(FluentIcons.library_28_filled),
            label: 'Your Library'),
      ],
    );
  }
}
