import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kalyani_app/src/overlay/controllers/config_controller.dart';
import 'package:kalyani_app/src/overlay/views/onboarding_view.dart';
import 'package:kalyani_app/src/overlay/views/upload_view.dart';
import 'package:kalyani_app/src/settings/controllers/settings_controller.dart';
import 'package:kalyani_app/theme.dart';

class KalyaniApp extends ConsumerWidget {
  const KalyaniApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final config = ref.watch(configControllerProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: MaterialTheme.lightScheme(),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 18),
          bodyMedium: TextStyle(fontSize: 16),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: MaterialTheme.darkScheme(),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 18),
          bodyMedium: TextStyle(fontSize: 16),
        ),
      ),
      themeMode: settings.themeMode,
      home: config.isConfigured ? const UploadView() : const OnboardingView(),
    );
  }
}
