import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kalyani_app/src/settings/controllers/settings_controller.dart';
import 'package:kalyani_app/theme.dart';

class KalyaniApp extends ConsumerWidget {
  const KalyaniApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: MaterialTheme.lightScheme(),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: MaterialTheme.darkScheme(),
      ),
      themeMode: settings.themeMode,
      home: const Center(),
    );
  }
}
