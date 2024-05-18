// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pc_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PCInfoHistoryDataImpl _$$PCInfoHistoryDataImplFromJson(
        Map<String, dynamic> json) =>
    _$PCInfoHistoryDataImpl(
      cpuUsage: (json['cpuUsage'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      gpusUsage: (json['gpusUsage'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k, (e as List<dynamic>).map((e) => (e as num).toDouble()).toList()),
      ),
    );

Map<String, dynamic> _$$PCInfoHistoryDataImplToJson(
        _$PCInfoHistoryDataImpl instance) =>
    <String, dynamic>{
      'cpuUsage': instance.cpuUsage,
      'gpusUsage': instance.gpusUsage,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pCInfoHistoryHash() => r'd7012b1ab2264eab7e1daf23e2b68d8076161962';

/// See also [PCInfoHistory].
@ProviderFor(PCInfoHistory)
final pCInfoHistoryProvider =
    NotifierProvider<PCInfoHistory, PCInfoHistoryData>.internal(
  PCInfoHistory.new,
  name: r'pCInfoHistoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pCInfoHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PCInfoHistory = Notifier<PCInfoHistoryData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
