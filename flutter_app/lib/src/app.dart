import 'package:flutter/material.dart';
import 'package:flutter_app/src/routing/router.dart';
import 'package:flutter_app/src/theme/theme.dart';

class SageStoneApp extends StatelessWidget {
  const SageStoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Uses GoRouter for routing (as suggested by the structure)
    return MaterialApp.router(
      routerConfig: router,
      title: 'SageStone Email Tool',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Placeholder for theme logic
    );
  }
}