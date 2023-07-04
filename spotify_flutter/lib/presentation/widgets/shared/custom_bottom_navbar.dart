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
    // return BottomNavigationBar(
    //   elevation: 0.0,
    //   enableFeedback: true,
    //   backgroundColor: const Color.fromRGBO(18, 18, 18, 0.1),
    //   selectedItemColor: Colors.white,
    //   unselectedItemColor: Colors.white70,
    //   currentIndex: currentIndex,
    //   onTap: (index) => onTabTapped(context, index),
    //   items: const [
    //     BottomNavigationBarItem(
    //         icon: Icon(FluentIcons.home_48_regular),
    //         activeIcon: Icon(FluentIcons.home_48_filled),
    //         label: 'Home'),
    //     BottomNavigationBarItem(
    //         icon: Icon(FluentIcons.search_48_regular),
    //         activeIcon: Icon(FluentIcons.search_48_filled),
    //         label: 'Search'),
    //     BottomNavigationBarItem(
    //         icon: Icon(FluentIcons.library_28_regular),
    //         activeIcon: Icon(FluentIcons.library_28_filled),
    //         label: 'Your Library'),
    //   ],
    // );
    final size = MediaQuery.of(context).size;

    return Offstage(
      offstage: false,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: AnimatedContainer(
          curve: Curves.easeIn,
          duration: const Duration(milliseconds: 400),
          height: size.height * 0.12,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.0),
                Colors.black.withOpacity(0.8),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.0, 0.4],
            ),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              elevation: 0,
              enableFeedback: true,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white70,
              onTap: (index) => onTabTapped(context, index),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(FluentIcons.home_20_regular),
                    activeIcon: Icon(FluentIcons.home_20_filled),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(FluentIcons.search_20_regular),
                    activeIcon: Icon(FluentIcons.search_20_filled),
                    label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(FluentIcons.library_20_regular),
                    activeIcon: Icon(FluentIcons.library_20_filled),
                    label: 'Your Library'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
