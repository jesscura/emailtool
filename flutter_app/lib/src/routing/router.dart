import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

// Public routes (website)
const String homeRoute = '/';
const String loginRoute = '/login';

// App tool routes
const String dashboardRoute = '/dashboard';
const String campaignsRoute = '/campaigns';

final router = GoRouter(
  initialLocation: homeRoute,
  routes: [
    GoRoute(
      path: homeRoute,
      builder: (context, state) => const Placeholder(child: Text('Home Screen')),
    ),
    GoRoute(
      path: loginRoute,
      builder: (context, state) => const Placeholder(child: Text('Login Screen')),
    ),
    // Placeholder for authenticated shell route and app screens
    GoRoute(
      path: dashboardRoute,
      builder: (context, state) => const Placeholder(child: Text('Dashboard')),
    ),
    // ... more routes for features
  ],
);