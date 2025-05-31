import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:hive_ce/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:kalyani_app/src/settings/models/settings_model.dart';

part 'settings_controller.g.dart';

@riverpod
class Settings extends _$Settings {
  @override
  SettingsModel build() {
    return init();
  }

  static SettingsModel init() {
    const defaultValue = SettingsModel(themeMode: ThemeMode.light);

    try {
      final Map<String, dynamic> raw = jsonDecode(
        Hive.box('nss').get(
          'settings',
          defaultValue: jsonEncode(defaultValue.toJson()),
        ),
      );

      return SettingsModel.fromJson(raw);
    } catch (err) {
      return defaultValue;
    }
  }

  void updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == state.themeMode || newThemeMode == null) return;

    state = state.copyWith(themeMode: newThemeMode);
    Hive.box('nss').put('settings', jsonEncode(state.toJson()));
  }
}
