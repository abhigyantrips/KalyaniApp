import 'package:freezed_annotation/freezed_annotation.dart';

import 'overlay_position.dart';

part 'app_config.freezed.dart';
part 'app_config.g.dart';

@freezed
class AppConfig with _$AppConfig {
  const factory AppConfig({
    String? leftOverlayPath,
    String? rightOverlayPath,
    @Default(OverlayPosition.bottomLeft) OverlayPosition selectedPosition,
  }) = _AppConfig;

  const AppConfig._();

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);

  bool get isConfigured => leftOverlayPath != null && rightOverlayPath != null;

  String? get currentOverlayPath =>
      selectedPosition == OverlayPosition.bottomLeft
          ? leftOverlayPath
          : rightOverlayPath;
}
