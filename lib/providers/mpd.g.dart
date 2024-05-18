// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mpd.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MpdDataImpl _$$MpdDataImplFromJson(Map<String, dynamic> json) =>
    _$MpdDataImpl(
      title: json['title'] as String?,
      artist: json['artist'] as String?,
      duration: json['duration'] == null
          ? null
          : Duration(microseconds: (json['duration'] as num).toInt()),
      elapsed: json['elapsed'] == null
          ? null
          : Duration(microseconds: (json['elapsed'] as num).toInt()),
      fetchedElapsed: json['fetchedElapsed'] == null
          ? null
          : DateTime.parse(json['fetchedElapsed'] as String),
      volume: (json['volume'] as num?)?.toDouble(),
      isPlaying: json['isPlaying'] as bool,
    );

Map<String, dynamic> _$$MpdDataImplToJson(_$MpdDataImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'artist': instance.artist,
      'duration': instance.duration?.inMicroseconds,
      'elapsed': instance.elapsed?.inMicroseconds,
      'fetchedElapsed': instance.fetchedElapsed?.toIso8601String(),
      'volume': instance.volume,
      'isPlaying': instance.isPlaying,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mpdStateHash() => r'77f5a82ad48849ef531012cf7973c48dbbf90f36';

/// See also [MpdState].
@ProviderFor(MpdState)
final mpdStateProvider =
    AutoDisposeNotifierProvider<MpdState, MpdData>.internal(
  MpdState.new,
  name: r'mpdStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mpdStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MpdState = AutoDisposeNotifier<MpdData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
