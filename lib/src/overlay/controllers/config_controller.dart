import 'dart:convert';

import 'package:hive_ce/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:kalyani_app/src/overlay/models/app_config.dart';
import 'package:kalyani_app/src/overlay/models/overlay_position.dart';

part 'config_controller.g.dart';

@riverpod
class ConfigController extends _$ConfigController {
  @override
  AppConfig build() {
    return _loadConfig();
  }

  AppConfig _loadConfig() {
    const defaultValue = AppConfig();

    try {
      final configJson = Hive.box('kalyani').get(
        'app_config',
        defaultValue: jsonEncode(defaultValue.toJson()),
      );

      if (configJson is String) {
        final Map<String, dynamic> raw = jsonDecode(configJson);
        return AppConfig.fromJson(raw);
      }

      return defaultValue;
    } catch (err) {
      return defaultValue;
    }
  }

  Future<void> setOverlayPath(OverlayPosition position, String path) async {
    final newConfig = position == OverlayPosition.bottomLeft
        ? state.copyWith(leftOverlayPath: path)
        : state.copyWith(rightOverlayPath: path);

    await _saveConfig(newConfig);
    state = newConfig;
  }

  void setSelectedPosition(OverlayPosition position) {
    state = state.copyWith(selectedPosition: position);
  }

  Future<void> _saveConfig(AppConfig config) async {
    await Hive.box('kalyani').put('app_config', jsonEncode(config.toJson()));
  }

  Future<void> resetConfig() async {
    await Hive.box('kalyani').delete('app_config');
    state = const AppConfig();
  }
}
