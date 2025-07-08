import 'package:go_router/go_router.dart';
import 'package:pokedex/features/home/screens/home.dart';
import 'package:pokedex/features/splash/splash_screen.dart';
import 'package:pokedex/shared/layout/mobile_layout.dart';
import 'package:pokedex/shared/utils/helper/screen_helper.dart';

class Routes {
  static final appRoutes = GoRouter(
    initialLocation: (ScreenHelper.isMobileDevice) ? '/splash' : '/home',
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => SplashScreen(),
      ),
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
