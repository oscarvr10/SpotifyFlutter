import 'package:flutter/material.dart';

class MyLibraryScreen extends StatefulWidget {
  const MyLibraryScreen({super.key});

  @override
  State<MyLibraryScreen> createState() => _MyLibraryScreenState();
}

class _MyLibraryScreenState extends State<MyLibraryScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }

  @override
  bool get wantKeepAlive => true;
}
