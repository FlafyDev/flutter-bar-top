// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devices_used.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DevicesUsedDataImpl _$$DevicesUsedDataImplFromJson(
        Map<String, dynamic> json) =>
    _$DevicesUsedDataImpl(
      microphone: json['microphone'] as bool,
      camera: json['camera'] as bool,
      screen: json['screen'] as bool,
    );

Map<String, dynamic> _$$DevicesUsedDataImplToJson(
        _$DevicesUsedDataImpl instance) =>
    <String, dynamic>{
      'microphone': instance.microphone,
      'camera': instance.camera,
      'screen': instance.screen,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$l4v2UsedHash() => r'854e09d46228b67c033f045533431bc8e75a7d94';

/// See also [_l4v2Used].
@ProviderFor(_l4v2Used)
final _l4v2UsedProvider = StreamProvider<bool>.internal(
  _l4v2Used,
  name: r'_l4v2UsedProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$l4v2UsedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _L4v2UsedRef = StreamProviderRef<bool>;
String _$devicesUsedHash() => r'3efbbe2920e354cf752b587ebef3df2e6bf5d3b9';

/// See also [DevicesUsed].
@ProviderFor(DevicesUsed)
final devicesUsedProvider =
    NotifierProvider<DevicesUsed, DevicesUsedData>.internal(
  DevicesUsed.new,
  name: r'devicesUsedProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$devicesUsedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DevicesUsed = Notifier<DevicesUsedData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
