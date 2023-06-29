import 'package:flutter/material.dart';
import 'package:spotify_flutter/presentation/modules/home/home_screen.dart';
import 'package:spotify_flutter/presentation/modules/library/my_library_screen.dart';
import 'package:spotify_flutter/presentation/modules/search/search_screen.dart';
import 'package:spotify_flutter/presentation/widgets/shared/custom_bottom_navbar.dart';

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

    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: viewRoutes,
      ),
      backgroundColor: const Color.fromRGBO(18, 18, 18, 1.0),
      bottomNavigationBar:
          CustomBottomNavigationBar(currentIndex: widget.pageIndex),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
