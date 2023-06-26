import 'package:flutter/widgets.dart';
import 'package:spotify_flutter/presentation/base_screen.dart';
import 'package:spotify_flutter/presentation/routes/routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.home: (context) => const BaseScreen(),
  };
}
