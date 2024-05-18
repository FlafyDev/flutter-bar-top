import 'package:flutter_bar_top/providers/bar_commands.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bar_popup_state.freezed.dart';
part 'bar_popup_state.g.dart';

@freezed
class BarPopupData with _$BarPopupData {
  const factory BarPopupData({
    required bool open,
    required String query,
  }) = _BarPopupData;

  factory BarPopupData.fromJson(Map<String, Object?> json) => _$BarPopupDataFromJson(json);
}


@riverpod
class BarPopupState extends _$BarPopupState {
  @override
  BarPopupData build() {
    ref.listen(barCommandsProvider, (prev, cmdsStream) {
      cmdsStream.whenData((cmd) {
        if (cmd is BarCommandOpen) {
          state = state.copyWith(open: true);
        }
        if (cmd is BarCommandToggle) {
          state = state.copyWith(open: !state.open);
        }
      });
    });
    return const BarPopupData(
      open: false,
      query: "",
    );
  }

  void show() => state = state.copyWith(open: true);
  void hide() => state = state.copyWith(open: false);
}
