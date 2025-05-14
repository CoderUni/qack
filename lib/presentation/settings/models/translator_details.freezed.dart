// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'translator_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
TranslatorSettings _$TranslatorSettingsFromJson(Map<String, dynamic> json) {
  return _TranslatorDetails.fromJson(json);
}

/// @nodoc
mixin _$TranslatorSettings {
  List<Translator> get enabledTranslators;
  TranslatorApiKeys get apiKeys;

  /// Create a copy of TranslatorSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TranslatorSettingsCopyWith<TranslatorSettings> get copyWith =>
      _$TranslatorSettingsCopyWithImpl<TranslatorSettings>(
          this as TranslatorSettings, _$identity);

  /// Serializes this TranslatorSettings to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TranslatorSettings &&
            const DeepCollectionEquality()
                .equals(other.enabledTranslators, enabledTranslators) &&
            const DeepCollectionEquality().equals(other.apiKeys, apiKeys));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(enabledTranslators),
      const DeepCollectionEquality().hash(apiKeys));

  @override
  String toString() {
    return 'TranslatorSettings(enabledTranslators: $enabledTranslators, apiKeys: $apiKeys)';
  }
}

/// @nodoc
abstract mixin class $TranslatorSettingsCopyWith<$Res> {
  factory $TranslatorSettingsCopyWith(
          TranslatorSettings value, $Res Function(TranslatorSettings) _then) =
      _$TranslatorSettingsCopyWithImpl;
  @useResult
  $Res call({List<Translator> enabledTranslators, TranslatorApiKeys apiKeys});
}

/// @nodoc
class _$TranslatorSettingsCopyWithImpl<$Res>
    implements $TranslatorSettingsCopyWith<$Res> {
  _$TranslatorSettingsCopyWithImpl(this._self, this._then);

  final TranslatorSettings _self;
  final $Res Function(TranslatorSettings) _then;

  /// Create a copy of TranslatorSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabledTranslators = null,
    Object? apiKeys = null,
  }) {
    return _then(_self.copyWith(
      enabledTranslators: null == enabledTranslators
          ? _self.enabledTranslators
          : enabledTranslators // ignore: cast_nullable_to_non_nullable
              as List<Translator>,
      apiKeys: null == apiKeys
          ? _self.apiKeys
          : apiKeys // ignore: cast_nullable_to_non_nullable
              as TranslatorApiKeys,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TranslatorDetails implements TranslatorSettings {
  _TranslatorDetails(
      {required final List<Translator> enabledTranslators,
      required final TranslatorApiKeys apiKeys})
      : _enabledTranslators = enabledTranslators,
        _apiKeys = apiKeys;
  factory _TranslatorDetails.fromJson(Map<String, dynamic> json) =>
      _$TranslatorDetailsFromJson(json);

  final List<Translator> _enabledTranslators;
  @override
  List<Translator> get enabledTranslators {
    if (_enabledTranslators is EqualUnmodifiableListView)
      return _enabledTranslators;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_enabledTranslators);
  }

  final TranslatorApiKeys _apiKeys;
  @override
  TranslatorApiKeys get apiKeys {
    if (_apiKeys is EqualUnmodifiableMapView) return _apiKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_apiKeys);
  }

  /// Create a copy of TranslatorSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TranslatorDetailsCopyWith<_TranslatorDetails> get copyWith =>
      __$TranslatorDetailsCopyWithImpl<_TranslatorDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TranslatorDetailsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TranslatorDetails &&
            const DeepCollectionEquality()
                .equals(other._enabledTranslators, _enabledTranslators) &&
            const DeepCollectionEquality().equals(other._apiKeys, _apiKeys));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_enabledTranslators),
      const DeepCollectionEquality().hash(_apiKeys));

  @override
  String toString() {
    return 'TranslatorSettings(enabledTranslators: $enabledTranslators, apiKeys: $apiKeys)';
  }
}

/// @nodoc
abstract mixin class _$TranslatorDetailsCopyWith<$Res>
    implements $TranslatorSettingsCopyWith<$Res> {
  factory _$TranslatorDetailsCopyWith(
          _TranslatorDetails value, $Res Function(_TranslatorDetails) _then) =
      __$TranslatorDetailsCopyWithImpl;
  @override
  @useResult
  $Res call({List<Translator> enabledTranslators, TranslatorApiKeys apiKeys});
}

/// @nodoc
class __$TranslatorDetailsCopyWithImpl<$Res>
    implements _$TranslatorDetailsCopyWith<$Res> {
  __$TranslatorDetailsCopyWithImpl(this._self, this._then);

  final _TranslatorDetails _self;
  final $Res Function(_TranslatorDetails) _then;

  /// Create a copy of TranslatorSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabledTranslators = null,
    Object? apiKeys = null,
  }) {
    return _then(_TranslatorDetails(
      enabledTranslators: null == enabledTranslators
          ? _self._enabledTranslators
          : enabledTranslators // ignore: cast_nullable_to_non_nullable
              as List<Translator>,
      apiKeys: null == apiKeys
          ? _self._apiKeys
          : apiKeys // ignore: cast_nullable_to_non_nullable
              as TranslatorApiKeys,
    ));
  }
}

// dart format on
