import 'package:go_router/go_router.dart';
import 'package:pokedex/core/dependency_injection/injectable.dart';
import 'package:pokedex/core/routes/screen_transitions.dart';
import 'package:pokedex/core/stores/connectivity_store.dart';
import 'package:pokedex/features/favorites/screens/fav_not_logged_screen.dart';
import 'package:pokedex/features/onboarding/screens/onboarding_main_screen.dart';
import 'package:pokedex/features/home/presentation/screens/home_screen.dart';
import 'package:pokedex/features/pokemon_details/presentation/screens/pokemon_details_screen.dart';
import 'package:pokedex/features/profile/screens/profile_screen.dart';
import 'package:pokedex/features/region/screens/regions_screen.dart';
import 'package:pokedex/features/splash/splash_screen.dart';
import 'package:pokedex/shared/layout/mobile_layout.dart';
import 'package:pokedex/shared/layout/mobile_mask_for_desktop.dart';
import 'package:pokedex/shared/screens/error_screen.dart';
import 'package:pokedex/shared/screens/offline_error_screen.dart';

class Routes {
  static final appRoutes = GoRouter(
    initialLocation: '/splash',
    redirect: (context, state) {
      final connectivityStore = getIt<ConnectivityStore>();

      final bool isConnected = connectivityStore.isConnected;
      final bool offlinePathMatched = state.matchedLocation == '/no_internet';

      final List<String> availableOfflinePaths = [
        '/splash',
        '/onboarding',
        '/no-internet',
      ];

      final bool isAvailable = availableOfflinePaths.contains(
        state.matchedLocation,
      );
      if (!isConnected && !isAvailable) {
        return '/no-internet';
      }

      if (isConnected && offlinePathMatched) {
        return '/';
      }

      return null;
    },
    routes: [
      ShellRoute(
        pageBuilder: (context, state, child) =>
            NoTransitionPage(child: MobileMaskForDesktop(child: child)),
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
                path: '/no_internet',
                name: 'no_internet',
                builder: (context, state) => OfflineErrorScreen(),
              ),
              GoRoute(
                path: '/error',
                name: 'error',
                builder: (context, state) => OfflineErrorScreen(),
              ),
              GoRoute(
                path: '/',
                name: 'home',
                pageBuilder: (context, state) =>
                    NoTransitionPage(child: HomeScreen()),
                routes: [
                  GoRoute(
                    path: '/pokemon_details/:id',
                    name: 'pokemon_details',
                    pageBuilder: (context, state) {
                      final idString = state.pathParameters['id'];
                      final id = int.tryParse(idString ?? '');

                      if (id == null || id <= 0) {
                        return NoTransitionPage(
                          child: ErrorScreen(
                            errorMessage: 'ID do Pokémon inválido.',
                          ),
                        );
                      }
                      
                      return NoTransitionPage(
                        child: PokemonDetailsScreen(id: id),
                      );
                    },
                    routes: [],
                  ),
                ],
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
      ),
    ],
  );
}
