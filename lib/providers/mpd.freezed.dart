// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mpd.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MpdData _$MpdDataFromJson(Map<String, dynamic> json) {
  return _MpdData.fromJson(json);
}

/// @nodoc
mixin _$MpdData {
  String? get title => throw _privateConstructorUsedError;
  String? get artist => throw _privateConstructorUsedError;
  Duration? get duration => throw _privateConstructorUsedError;
  Duration? get elapsed => throw _privateConstructorUsedError;
  DateTime? get fetchedElapsed => throw _privateConstructorUsedError;
  double? get volume => throw _privateConstructorUsedError;
  bool get isPlaying => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MpdDataCopyWith<MpdData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MpdDataCopyWith<$Res> {
  factory $MpdDataCopyWith(MpdData value, $Res Function(MpdData) then) =
      _$MpdDataCopyWithImpl<$Res, MpdData>;
  @useResult
  $Res call(
      {String? title,
      String? artist,
      Duration? duration,
      Duration? elapsed,
      DateTime? fetchedElapsed,
      double? volume,
      bool isPlaying});
}

/// @nodoc
class _$MpdDataCopyWithImpl<$Res, $Val extends MpdData>
    implements $MpdDataCopyWith<$Res> {
  _$MpdDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? artist = freezed,
    Object? duration = freezed,
    Object? elapsed = freezed,
    Object? fetchedElapsed = freezed,
    Object? volume = freezed,
    Object? isPlaying = null,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      artist: freezed == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      elapsed: freezed == elapsed
          ? _value.elapsed
          : elapsed // ignore: cast_nullable_to_non_nullable
              as Duration?,
      fetchedElapsed: freezed == fetchedElapsed
          ? _value.fetchedElapsed
          : fetchedElapsed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      volume: freezed == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double?,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MpdDataImplCopyWith<$Res> implements $MpdDataCopyWith<$Res> {
  factory _$$MpdDataImplCopyWith(
          _$MpdDataImpl value, $Res Function(_$MpdDataImpl) then) =
      __$$MpdDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      String? artist,
      Duration? duration,
      Duration? elapsed,
      DateTime? fetchedElapsed,
      double? volume,
      bool isPlaying});
}

/// @nodoc
class __$$MpdDataImplCopyWithImpl<$Res>
    extends _$MpdDataCopyWithImpl<$Res, _$MpdDataImpl>
    implements _$$MpdDataImplCopyWith<$Res> {
  __$$MpdDataImplCopyWithImpl(
      _$MpdDataImpl _value, $Res Function(_$MpdDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? artist = freezed,
    Object? duration = freezed,
    Object? elapsed = freezed,
    Object? fetchedElapsed = freezed,
    Object? volume = freezed,
    Object? isPlaying = null,
  }) {
    return _then(_$MpdDataImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      artist: freezed == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
      elapsed: freezed == elapsed
          ? _value.elapsed
          : elapsed // ignore: cast_nullable_to_non_nullable
              as Duration?,
      fetchedElapsed: freezed == fetchedElapsed
          ? _value.fetchedElapsed
          : fetchedElapsed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      volume: freezed == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double?,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MpdDataImpl with DiagnosticableTreeMixin implements _MpdData {
  const _$MpdDataImpl(
      {this.title,
      this.artist,
      this.duration,
      this.elapsed,
      this.fetchedElapsed,
      this.volume,
      required this.isPlaying});

  factory _$MpdDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MpdDataImplFromJson(json);

  @override
  final String? title;
  @override
  final String? artist;
  @override
  final Duration? duration;
  @override
  final Duration? elapsed;
  @override
  final DateTime? fetchedElapsed;
  @override
  final double? volume;
  @override
  final bool isPlaying;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MpdData(title: $title, artist: $artist, duration: $duration, elapsed: $elapsed, fetchedElapsed: $fetchedElapsed, volume: $volume, isPlaying: $isPlaying)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MpdData'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('artist', artist))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('elapsed', elapsed))
      ..add(DiagnosticsProperty('fetchedElapsed', fetchedElapsed))
      ..add(DiagnosticsProperty('volume', volume))
      ..add(DiagnosticsProperty('isPlaying', isPlaying));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MpdDataImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.elapsed, elapsed) || other.elapsed == elapsed) &&
            (identical(other.fetchedElapsed, fetchedElapsed) ||
                other.fetchedElapsed == fetchedElapsed) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.isPlaying, isPlaying) ||
                other.isPlaying == isPlaying));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, artist, duration, elapsed,
      fetchedElapsed, volume, isPlaying);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MpdDataImplCopyWith<_$MpdDataImpl> get copyWith =>
      __$$MpdDataImplCopyWithImpl<_$MpdDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MpdDataImplToJson(
      this,
    );
  }
}

abstract class _MpdData implements MpdData {
  const factory _MpdData(
      {final String? title,
      final String? artist,
      final Duration? duration,
      final Duration? elapsed,
      final DateTime? fetchedElapsed,
      final double? volume,
      required final bool isPlaying}) = _$MpdDataImpl;

  factory _MpdData.fromJson(Map<String, dynamic> json) = _$MpdDataImpl.fromJson;

  @override
  String? get title;
  @override
  String? get artist;
  @override
  Duration? get duration;
  @override
  Duration? get elapsed;
  @override
  DateTime? get fetchedElapsed;
  @override
  double? get volume;
  @override
  bool get isPlaying;
  @override
  @JsonKey(ignore: true)
  _$$MpdDataImplCopyWith<_$MpdDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
