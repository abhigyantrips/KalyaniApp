// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppConfigImpl _$$AppConfigImplFromJson(Map<String, dynamic> json) =>
    _$AppConfigImpl(
      leftOverlayPath: json['leftOverlayPath'] as String?,
      rightOverlayPath: json['rightOverlayPath'] as String?,
      selectedPosition: $enumDecodeNullable(
              _$OverlayPositionEnumMap, json['selectedPosition']) ??
          OverlayPosition.bottomLeft,
    );

Map<String, dynamic> _$$AppConfigImplToJson(_$AppConfigImpl instance) =>
    <String, dynamic>{
      'leftOverlayPath': instance.leftOverlayPath,
      'rightOverlayPath': instance.rightOverlayPath,
      'selectedPosition': _$OverlayPositionEnumMap[instance.selectedPosition]!,
    };

const _$OverlayPositionEnumMap = {
  OverlayPosition.bottomLeft: 'bottomLeft',
  OverlayPosition.bottomRight: 'bottomRight',
};
