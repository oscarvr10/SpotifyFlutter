import 'package:flutter/material.dart';
import 'package:spotify_flutter/presentation/routes/app_routes.dart';
import 'package:spotify_flutter/presentation/routes/routes.dart';
import 'package:spotify_flutter/presentation/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      routes: appRoutes,
      theme: AppTheme().getTheme(),
    );
  }
}
