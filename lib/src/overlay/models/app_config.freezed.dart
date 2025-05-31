// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) {
  return _AppConfig.fromJson(json);
}

/// @nodoc
mixin _$AppConfig {
  String? get leftOverlayPath => throw _privateConstructorUsedError;
  String? get rightOverlayPath => throw _privateConstructorUsedError;
  OverlayPosition get selectedPosition => throw _privateConstructorUsedError;

  /// Serializes this AppConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppConfigCopyWith<AppConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppConfigCopyWith<$Res> {
  factory $AppConfigCopyWith(AppConfig value, $Res Function(AppConfig) then) =
      _$AppConfigCopyWithImpl<$Res, AppConfig>;
  @useResult
  $Res call(
      {String? leftOverlayPath,
      String? rightOverlayPath,
      OverlayPosition selectedPosition});
}

/// @nodoc
class _$AppConfigCopyWithImpl<$Res, $Val extends AppConfig>
    implements $AppConfigCopyWith<$Res> {
  _$AppConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leftOverlayPath = freezed,
    Object? rightOverlayPath = freezed,
    Object? selectedPosition = null,
  }) {
    return _then(_value.copyWith(
      leftOverlayPath: freezed == leftOverlayPath
          ? _value.leftOverlayPath
          : leftOverlayPath // ignore: cast_nullable_to_non_nullable
              as String?,
      rightOverlayPath: freezed == rightOverlayPath
          ? _value.rightOverlayPath
          : rightOverlayPath // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedPosition: null == selectedPosition
          ? _value.selectedPosition
          : selectedPosition // ignore: cast_nullable_to_non_nullable
              as OverlayPosition,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppConfigImplCopyWith<$Res>
    implements $AppConfigCopyWith<$Res> {
  factory _$$AppConfigImplCopyWith(
          _$AppConfigImpl value, $Res Function(_$AppConfigImpl) then) =
      __$$AppConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? leftOverlayPath,
      String? rightOverlayPath,
      OverlayPosition selectedPosition});
}

/// @nodoc
class __$$AppConfigImplCopyWithImpl<$Res>
    extends _$AppConfigCopyWithImpl<$Res, _$AppConfigImpl>
    implements _$$AppConfigImplCopyWith<$Res> {
  __$$AppConfigImplCopyWithImpl(
      _$AppConfigImpl _value, $Res Function(_$AppConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leftOverlayPath = freezed,
    Object? rightOverlayPath = freezed,
    Object? selectedPosition = null,
  }) {
    return _then(_$AppConfigImpl(
      leftOverlayPath: freezed == leftOverlayPath
          ? _value.leftOverlayPath
          : leftOverlayPath // ignore: cast_nullable_to_non_nullable
              as String?,
      rightOverlayPath: freezed == rightOverlayPath
          ? _value.rightOverlayPath
          : rightOverlayPath // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedPosition: null == selectedPosition
          ? _value.selectedPosition
          : selectedPosition // ignore: cast_nullable_to_non_nullable
              as OverlayPosition,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppConfigImpl extends _AppConfig {
  const _$AppConfigImpl(
      {this.leftOverlayPath,
      this.rightOverlayPath,
      this.selectedPosition = OverlayPosition.bottomLeft})
      : super._();

  factory _$AppConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppConfigImplFromJson(json);

  @override
  final String? leftOverlayPath;
  @override
  final String? rightOverlayPath;
  @override
  @JsonKey()
  final OverlayPosition selectedPosition;

  @override
  String toString() {
    return 'AppConfig(leftOverlayPath: $leftOverlayPath, rightOverlayPath: $rightOverlayPath, selectedPosition: $selectedPosition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppConfigImpl &&
            (identical(other.leftOverlayPath, leftOverlayPath) ||
                other.leftOverlayPath == leftOverlayPath) &&
            (identical(other.rightOverlayPath, rightOverlayPath) ||
                other.rightOverlayPath == rightOverlayPath) &&
            (identical(other.selectedPosition, selectedPosition) ||
                other.selectedPosition == selectedPosition));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, leftOverlayPath, rightOverlayPath, selectedPosition);

  /// Create a copy of AppConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppConfigImplCopyWith<_$AppConfigImpl> get copyWith =>
      __$$AppConfigImplCopyWithImpl<_$AppConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppConfigImplToJson(
      this,
    );
  }
}

abstract class _AppConfig extends AppConfig {
  const factory _AppConfig(
      {final String? leftOverlayPath,
      final String? rightOverlayPath,
      final OverlayPosition selectedPosition}) = _$AppConfigImpl;
  const _AppConfig._() : super._();

  factory _AppConfig.fromJson(Map<String, dynamic> json) =
      _$AppConfigImpl.fromJson;

  @override
  String? get leftOverlayPath;
  @override
  String? get rightOverlayPath;
  @override
  OverlayPosition get selectedPosition;

  /// Create a copy of AppConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppConfigImplCopyWith<_$AppConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
