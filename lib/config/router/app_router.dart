import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return HomeScreens();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'buttons',
          builder: (BuildContext context, GoRouterState state) {
            return const ButtonScreen();
          },
        ),
        GoRoute(
          path: 'cards',
          builder: (BuildContext context, GoRouterState state) {
            return const CardsScreen();
          },
        ),
        GoRoute(
          path: 'progress',
          builder: (BuildContext context, GoRouterState state) {
            return const ProgressScreens();
          },
        ),
        GoRoute(
          path: 'snackbar',
          builder: (BuildContext context, GoRouterState state) {
            return const SnackbarScreens();
          },
        ),
        GoRoute(
          path: 'animated',
          builder: (BuildContext context, GoRouterState state) {
            return const AnimatedScreens();
          },
        ),
        GoRoute(
          path: 'ui-controls',
          builder: (BuildContext context, GoRouterState state) {
            return const UiControlsScreens();
          },
        ),
        GoRoute(
          path: 'tutorial',
          builder: (BuildContext context, GoRouterState state) {
            return const AppTutorialScreens();
          },
        ),
        GoRoute(
          path: 'infinite',
          builder: (BuildContext context, GoRouterState state) {
            return const InfiniteScrollScreens();
          },
        ),
        GoRoute(
          path: 'counter',
          builder: (BuildContext context, GoRouterState state) {
            return const CounterScreen();
          },
        ),
        GoRoute(
          path: 'theme-changer',
          builder: (BuildContext context, GoRouterState state) {
            return const ThemeChangerScreen();
          },
        )
        
      ],
    ),
  ],
);
