// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pc_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PCInfoHistoryData _$PCInfoHistoryDataFromJson(Map<String, dynamic> json) {
  return _PCInfoHistoryData.fromJson(json);
}

/// @nodoc
mixin _$PCInfoHistoryData {
  List<double> get cpuUsage => throw _privateConstructorUsedError;
  Map<String, List<double>> get gpusUsage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PCInfoHistoryDataCopyWith<PCInfoHistoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PCInfoHistoryDataCopyWith<$Res> {
  factory $PCInfoHistoryDataCopyWith(
          PCInfoHistoryData value, $Res Function(PCInfoHistoryData) then) =
      _$PCInfoHistoryDataCopyWithImpl<$Res, PCInfoHistoryData>;
  @useResult
  $Res call({List<double> cpuUsage, Map<String, List<double>> gpusUsage});
}

/// @nodoc
class _$PCInfoHistoryDataCopyWithImpl<$Res, $Val extends PCInfoHistoryData>
    implements $PCInfoHistoryDataCopyWith<$Res> {
  _$PCInfoHistoryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cpuUsage = null,
    Object? gpusUsage = null,
  }) {
    return _then(_value.copyWith(
      cpuUsage: null == cpuUsage
          ? _value.cpuUsage
          : cpuUsage // ignore: cast_nullable_to_non_nullable
              as List<double>,
      gpusUsage: null == gpusUsage
          ? _value.gpusUsage
          : gpusUsage // ignore: cast_nullable_to_non_nullable
              as Map<String, List<double>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PCInfoHistoryDataImplCopyWith<$Res>
    implements $PCInfoHistoryDataCopyWith<$Res> {
  factory _$$PCInfoHistoryDataImplCopyWith(_$PCInfoHistoryDataImpl value,
          $Res Function(_$PCInfoHistoryDataImpl) then) =
      __$$PCInfoHistoryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<double> cpuUsage, Map<String, List<double>> gpusUsage});
}

/// @nodoc
class __$$PCInfoHistoryDataImplCopyWithImpl<$Res>
    extends _$PCInfoHistoryDataCopyWithImpl<$Res, _$PCInfoHistoryDataImpl>
    implements _$$PCInfoHistoryDataImplCopyWith<$Res> {
  __$$PCInfoHistoryDataImplCopyWithImpl(_$PCInfoHistoryDataImpl _value,
      $Res Function(_$PCInfoHistoryDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cpuUsage = null,
    Object? gpusUsage = null,
  }) {
    return _then(_$PCInfoHistoryDataImpl(
      cpuUsage: null == cpuUsage
          ? _value._cpuUsage
          : cpuUsage // ignore: cast_nullable_to_non_nullable
              as List<double>,
      gpusUsage: null == gpusUsage
          ? _value._gpusUsage
          : gpusUsage // ignore: cast_nullable_to_non_nullable
              as Map<String, List<double>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PCInfoHistoryDataImpl
    with DiagnosticableTreeMixin
    implements _PCInfoHistoryData {
  const _$PCInfoHistoryDataImpl(
      {required final List<double> cpuUsage,
      required final Map<String, List<double>> gpusUsage})
      : _cpuUsage = cpuUsage,
        _gpusUsage = gpusUsage;

  factory _$PCInfoHistoryDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PCInfoHistoryDataImplFromJson(json);

  final List<double> _cpuUsage;
  @override
  List<double> get cpuUsage {
    if (_cpuUsage is EqualUnmodifiableListView) return _cpuUsage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cpuUsage);
  }

  final Map<String, List<double>> _gpusUsage;
  @override
  Map<String, List<double>> get gpusUsage {
    if (_gpusUsage is EqualUnmodifiableMapView) return _gpusUsage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_gpusUsage);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PCInfoHistoryData(cpuUsage: $cpuUsage, gpusUsage: $gpusUsage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PCInfoHistoryData'))
      ..add(DiagnosticsProperty('cpuUsage', cpuUsage))
      ..add(DiagnosticsProperty('gpusUsage', gpusUsage));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PCInfoHistoryDataImpl &&
            const DeepCollectionEquality().equals(other._cpuUsage, _cpuUsage) &&
            const DeepCollectionEquality()
                .equals(other._gpusUsage, _gpusUsage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cpuUsage),
      const DeepCollectionEquality().hash(_gpusUsage));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PCInfoHistoryDataImplCopyWith<_$PCInfoHistoryDataImpl> get copyWith =>
      __$$PCInfoHistoryDataImplCopyWithImpl<_$PCInfoHistoryDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PCInfoHistoryDataImplToJson(
      this,
    );
  }
}

abstract class _PCInfoHistoryData implements PCInfoHistoryData {
  const factory _PCInfoHistoryData(
          {required final List<double> cpuUsage,
          required final Map<String, List<double>> gpusUsage}) =
      _$PCInfoHistoryDataImpl;

  factory _PCInfoHistoryData.fromJson(Map<String, dynamic> json) =
      _$PCInfoHistoryDataImpl.fromJson;

  @override
  List<double> get cpuUsage;
  @override
  Map<String, List<double>> get gpusUsage;
  @override
  @JsonKey(ignore: true)
  _$$PCInfoHistoryDataImplCopyWith<_$PCInfoHistoryDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
