import 'package:go_router/go_router.dart';
import 'package:pokedex/features/home/screens/home.dart';
import 'package:pokedex/shared/layout/mobile_layout.dart';

class Routes {
  static final appRoutes = GoRouter(
    initialLocation: '/home',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return MobileLayout(mobileBody: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            name: 'home',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: HomePage()),
            routes: [],
          ),
        ],
      ),
    ],
  );
}
