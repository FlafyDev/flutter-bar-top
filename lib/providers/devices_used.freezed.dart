// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'devices_used.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DevicesUsedData _$DevicesUsedDataFromJson(Map<String, dynamic> json) {
  return _DevicesUsedData.fromJson(json);
}

/// @nodoc
mixin _$DevicesUsedData {
  bool get microphone => throw _privateConstructorUsedError;
  bool get camera => throw _privateConstructorUsedError;
  bool get screen => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DevicesUsedDataCopyWith<DevicesUsedData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DevicesUsedDataCopyWith<$Res> {
  factory $DevicesUsedDataCopyWith(
          DevicesUsedData value, $Res Function(DevicesUsedData) then) =
      _$DevicesUsedDataCopyWithImpl<$Res, DevicesUsedData>;
  @useResult
  $Res call({bool microphone, bool camera, bool screen});
}

/// @nodoc
class _$DevicesUsedDataCopyWithImpl<$Res, $Val extends DevicesUsedData>
    implements $DevicesUsedDataCopyWith<$Res> {
  _$DevicesUsedDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? microphone = null,
    Object? camera = null,
    Object? screen = null,
  }) {
    return _then(_value.copyWith(
      microphone: null == microphone
          ? _value.microphone
          : microphone // ignore: cast_nullable_to_non_nullable
              as bool,
      camera: null == camera
          ? _value.camera
          : camera // ignore: cast_nullable_to_non_nullable
              as bool,
      screen: null == screen
          ? _value.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DevicesUsedDataImplCopyWith<$Res>
    implements $DevicesUsedDataCopyWith<$Res> {
  factory _$$DevicesUsedDataImplCopyWith(_$DevicesUsedDataImpl value,
          $Res Function(_$DevicesUsedDataImpl) then) =
      __$$DevicesUsedDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool microphone, bool camera, bool screen});
}

/// @nodoc
class __$$DevicesUsedDataImplCopyWithImpl<$Res>
    extends _$DevicesUsedDataCopyWithImpl<$Res, _$DevicesUsedDataImpl>
    implements _$$DevicesUsedDataImplCopyWith<$Res> {
  __$$DevicesUsedDataImplCopyWithImpl(
      _$DevicesUsedDataImpl _value, $Res Function(_$DevicesUsedDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? microphone = null,
    Object? camera = null,
    Object? screen = null,
  }) {
    return _then(_$DevicesUsedDataImpl(
      microphone: null == microphone
          ? _value.microphone
          : microphone // ignore: cast_nullable_to_non_nullable
              as bool,
      camera: null == camera
          ? _value.camera
          : camera // ignore: cast_nullable_to_non_nullable
              as bool,
      screen: null == screen
          ? _value.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DevicesUsedDataImpl implements _DevicesUsedData {
  const _$DevicesUsedDataImpl(
      {required this.microphone, required this.camera, required this.screen});

  factory _$DevicesUsedDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DevicesUsedDataImplFromJson(json);

  @override
  final bool microphone;
  @override
  final bool camera;
  @override
  final bool screen;

  @override
  String toString() {
    return 'DevicesUsedData(microphone: $microphone, camera: $camera, screen: $screen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DevicesUsedDataImpl &&
            (identical(other.microphone, microphone) ||
                other.microphone == microphone) &&
            (identical(other.camera, camera) || other.camera == camera) &&
            (identical(other.screen, screen) || other.screen == screen));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, microphone, camera, screen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DevicesUsedDataImplCopyWith<_$DevicesUsedDataImpl> get copyWith =>
      __$$DevicesUsedDataImplCopyWithImpl<_$DevicesUsedDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DevicesUsedDataImplToJson(
      this,
    );
  }
}

abstract class _DevicesUsedData implements DevicesUsedData {
  const factory _DevicesUsedData(
      {required final bool microphone,
      required final bool camera,
      required final bool screen}) = _$DevicesUsedDataImpl;

  factory _DevicesUsedData.fromJson(Map<String, dynamic> json) =
      _$DevicesUsedDataImpl.fromJson;

  @override
  bool get microphone;
  @override
  bool get camera;
  @override
  bool get screen;
  @override
  @JsonKey(ignore: true)
  _$$DevicesUsedDataImplCopyWith<_$DevicesUsedDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
