import 'package:go_router/go_router.dart';
import 'package:pokedex/core/dependency_injection/injectable.dart';
import 'package:pokedex/core/routes/screen_transitions.dart';
import 'package:pokedex/core/services/general_settings_cache_service.dart';
import 'package:pokedex/core/stores/app_error_store.dart';
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
import 'package:pokedex/shared/utils/helper/route_refresh.dart';

class Routes {
  static final routeRefresh = getIt<RouteRefresh>();
  static final appRoutes = GoRouter(
    initialLocation: '/splash',
    refreshListenable: routeRefresh,
    redirect: (context, state) async {
      final generalSettings = getIt<GeneralSettingsCacheService>();
      final appErrorStore = getIt<AppErrorStore>();
      final connectivityStore = getIt<ConnectivityStore>();

      final hasGlobalError = appErrorStore.globalErrorMessage != null;
      final isErrorRoute =
          state.matchedLocation.contains('/error') ||
          state.matchedLocation.contains('/no_internet');

      if (hasGlobalError && !isErrorRoute) {
        final isConnectionError =
            !connectivityStore.isConnected ||
            (appErrorStore.globalErrorMessage?.contains('conexão') ?? false);

        final targetPath = state.matchedLocation;
        final encoded = Uri.encodeComponent(targetPath);

        if (targetPath == '/') {
          return isConnectionError ? '/no_internet' : '/error';
        }

        return isConnectionError
            ? '/no_internet?from=$encoded'
            : '/error?from=$encoded';
      }

      if (hasGlobalError && isErrorRoute) return null;

      if (!hasGlobalError && isErrorRoute) {
        final fromPath = state.uri.queryParameters['from'];

        if (fromPath != null) {
          return Uri.decodeComponent(fromPath);
        }

        return '/';
      }

      final hasSeenOnboarding = await generalSettings.hasSeenOnboarding;
      final isOnboardingRoute =
          state.matchedLocation == '/onboarding' ||
          state.matchedLocation == '/splash';

      if (hasSeenOnboarding && isOnboardingRoute) return '/';

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
          GoRoute(
            path: '/no_internet',
            name: 'no_internet',
            builder: (context, state) => OfflineErrorScreen(),
          ),
          GoRoute(
            path: '/error',
            name: 'error',
            builder: (context, state) => ErrorScreen(),
          ),
          ShellRoute(
            pageBuilder: (context, state, child) => ScreenTransitions.slideUpIn(
              state: state,
              child: MobileLayout(mobileBody: child),
            ),
            routes: [
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
                        return NoTransitionPage(child: ErrorScreen());
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
