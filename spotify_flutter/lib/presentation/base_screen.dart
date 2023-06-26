import 'package:flutter/material.dart';
import 'package:spotify_flutter/presentation/widgets/shared/custom_bottom_navbar.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(
        currentIndex: 0,
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
