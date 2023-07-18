import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spotify_flutter/presentation/modules/home/home_screen.dart';
import 'package:spotify_flutter/presentation/modules/library/my_library_screen.dart';
import 'package:spotify_flutter/presentation/modules/search/search_screen.dart';

import 'widgets/shared/shared.dart';

class BaseScreen extends StatefulWidget {
  final int pageIndex;

  const BaseScreen({super.key, required this.pageIndex});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen>
    with AutomaticKeepAliveClientMixin {
  late PageController pageController;

  final viewRoutes = const <Widget>[
    HomeScreen(),
    SearchScreen(),
    MyLibraryScreen(),
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(keepPage: true);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (pageController.hasClients) {
      pageController.animateToPage(
        widget.pageIndex,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 250),
      );
    }

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness:
              Brightness.dark //or set color with: Color(0xFF0000FF)
          ),
    );

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: viewRoutes,
          ),
          const PlayerControl(),
          CustomBottomNavigationBar(currentIndex: widget.pageIndex),
        ],
      ),
      backgroundColor: const Color.fromRGBO(18, 18, 18, 1.0),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
