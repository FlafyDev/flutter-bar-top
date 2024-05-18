// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bar_popup_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BarPopupDataImpl _$$BarPopupDataImplFromJson(Map<String, dynamic> json) =>
    _$BarPopupDataImpl(
      open: json['open'] as bool,
      query: json['query'] as String,
    );

Map<String, dynamic> _$$BarPopupDataImplToJson(_$BarPopupDataImpl instance) =>
    <String, dynamic>{
      'open': instance.open,
      'query': instance.query,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$barPopupStateHash() => r'3d880c1e7b5bc2c83c0586cca66c9688113e5aa3';

/// See also [BarPopupState].
@ProviderFor(BarPopupState)
final barPopupStateProvider =
    AutoDisposeNotifierProvider<BarPopupState, BarPopupData>.internal(
  BarPopupState.new,
  name: r'barPopupStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$barPopupStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BarPopupState = AutoDisposeNotifier<BarPopupData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
