import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/core/constants/constants.dart';
import 'package:my_portfolio/features/features.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/about',
  redirect: (context, state) {
    if (state.uri.path == '/') return '/about';

    final section = state.pathParameters['section'];
    if (section != null && !PortfolioConfig.navSectionIds.contains(section)) {
      return '/about';
    }

    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      redirect: (context, state) => '/about',
    ),
    GoRoute(
      path: '/:section',
      builder: (context, state) {
        final section = state.pathParameters['section']!;
        return HomeScreen(targetSection: section);
      },
    ),
  ],
);
