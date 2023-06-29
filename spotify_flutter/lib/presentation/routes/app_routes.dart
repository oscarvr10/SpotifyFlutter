import 'package:go_router/go_router.dart';
import 'package:spotify_flutter/presentation/base_screen.dart';
import 'package:spotify_flutter/presentation/routes/routes.dart';

final appRouter = GoRouter(
  initialLocation: '${Routes.home}/0',
  routes: [
    GoRoute(
      path: '${Routes.home}/:page',
      name: Routes.home,
      builder: (context, state) {
        final pageIndex = int.parse(state.pathParameters['page'] ?? '0');
        return BaseScreen(pageIndex: pageIndex);
      },
    ),
    GoRoute(
      path: '/',
      redirect: (_, __) => '${Routes.home}/0',
    )
  ],
);
