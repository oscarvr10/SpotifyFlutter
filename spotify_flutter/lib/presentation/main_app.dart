import 'package:flutter/material.dart';
import 'package:spotify_flutter/presentation/routes/app_routes.dart';
import 'package:spotify_flutter/presentation/theme/app_theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
