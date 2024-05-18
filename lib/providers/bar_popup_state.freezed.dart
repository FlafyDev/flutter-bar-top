// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bar_popup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BarPopupData _$BarPopupDataFromJson(Map<String, dynamic> json) {
  return _BarPopupData.fromJson(json);
}

/// @nodoc
mixin _$BarPopupData {
  bool get open => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BarPopupDataCopyWith<BarPopupData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BarPopupDataCopyWith<$Res> {
  factory $BarPopupDataCopyWith(
          BarPopupData value, $Res Function(BarPopupData) then) =
      _$BarPopupDataCopyWithImpl<$Res, BarPopupData>;
  @useResult
  $Res call({bool open, String query});
}

/// @nodoc
class _$BarPopupDataCopyWithImpl<$Res, $Val extends BarPopupData>
    implements $BarPopupDataCopyWith<$Res> {
  _$BarPopupDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? open = null,
    Object? query = null,
  }) {
    return _then(_value.copyWith(
      open: null == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as bool,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BarPopupDataImplCopyWith<$Res>
    implements $BarPopupDataCopyWith<$Res> {
  factory _$$BarPopupDataImplCopyWith(
          _$BarPopupDataImpl value, $Res Function(_$BarPopupDataImpl) then) =
      __$$BarPopupDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool open, String query});
}

/// @nodoc
class __$$BarPopupDataImplCopyWithImpl<$Res>
    extends _$BarPopupDataCopyWithImpl<$Res, _$BarPopupDataImpl>
    implements _$$BarPopupDataImplCopyWith<$Res> {
  __$$BarPopupDataImplCopyWithImpl(
      _$BarPopupDataImpl _value, $Res Function(_$BarPopupDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? open = null,
    Object? query = null,
  }) {
    return _then(_$BarPopupDataImpl(
      open: null == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as bool,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BarPopupDataImpl implements _BarPopupData {
  const _$BarPopupDataImpl({required this.open, required this.query});

  factory _$BarPopupDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$BarPopupDataImplFromJson(json);

  @override
  final bool open;
  @override
  final String query;

  @override
  String toString() {
    return 'BarPopupData(open: $open, query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BarPopupDataImpl &&
            (identical(other.open, open) || other.open == open) &&
            (identical(other.query, query) || other.query == query));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, open, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BarPopupDataImplCopyWith<_$BarPopupDataImpl> get copyWith =>
      __$$BarPopupDataImplCopyWithImpl<_$BarPopupDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BarPopupDataImplToJson(
      this,
    );
  }
}

abstract class _BarPopupData implements BarPopupData {
  const factory _BarPopupData(
      {required final bool open,
      required final String query}) = _$BarPopupDataImpl;

  factory _BarPopupData.fromJson(Map<String, dynamic> json) =
      _$BarPopupDataImpl.fromJson;

  @override
  bool get open;
  @override
  String get query;
  @override
  @JsonKey(ignore: true)
  _$$BarPopupDataImplCopyWith<_$BarPopupDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
