import 'package:go_router/go_router.dart';
import 'package:pokedex/core/routes/screen_transitions.dart';
import 'package:pokedex/features/favorites/screens/fav_not_logged_screen.dart';
import 'package:pokedex/features/onboarding/screens/onboarding_main_screen.dart';
import 'package:pokedex/features/home/screens/home_screen.dart';
import 'package:pokedex/features/profile/screens/profile_screen.dart';
import 'package:pokedex/features/region/screens/regions_screen.dart';
import 'package:pokedex/features/splash/splash_screen.dart';
import 'package:pokedex/shared/layout/mobile_layout.dart';
import 'package:pokedex/shared/utils/helper/screen_helper.dart';

class Routes {
  static final appRoutes = GoRouter(
    initialLocation: (ScreenHelper.isMobileDevice) ? '/splash' : '/onboarding',
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        pageBuilder: (context, state) => ScreenTransitions.fadeIn(
          state: state,
          child: OnboardingMainScreen(),
        ),
      ),
      ShellRoute(
        pageBuilder: (context, state, child) => ScreenTransitions.slideUpIn(
          state: state,
          child: MobileLayout(mobileBody: child),
        ),
        routes: [
          GoRoute(
            path: '/home',
            name: 'home',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: HomeScreen()),
            routes: [],
          ),
          GoRoute(
            path: '/regions',
            name: 'regions',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: RegionsScreen()),
            routes: [],
          ),
          GoRoute(
            path: '/favorites',
            name: 'favorites',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: FavNotLoggedScreen()),
            routes: [],
          ),
          GoRoute(
            path: '/profile',
            name: 'profile',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: ProfileScreen()),
            routes: [],
          ),
        ],
      ),
    ],
  );
}
