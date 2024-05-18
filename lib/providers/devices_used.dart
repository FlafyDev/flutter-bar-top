import 'dart:io';

import 'package:flutter_bar_top/providers/bar_commands.dart';
import 'package:flutter_bar_top/providers/pipewire_json_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'devices_used.freezed.dart';
part 'devices_used.g.dart';

@Riverpod(keepAlive: true)
Stream<bool> _l4v2Used(_L4v2UsedRef ref) async* {
  final process = await Process.start("inotifywait", [
    "-m",
    "/dev/video1"
  ]);

  final stdoutStream = process.stdout;

  Future<bool> checkVid() async {
    final process2 = await Process.run("lsof", [
      "/dev/video1"
    ]);
    final lines = process2.stdout.toString().split("\n").sublist(1).where((l) => l.trim().isNotEmpty).toList();
    if (lines.length == 1) {
      final pid = int.parse(lines.first.split(" ")[1]);
      final wireplumberPid = int.parse((await Process.run("systemctl", [
        "show",
        "-p",
        "MainPID",
        "--value",
        "--user",
        "wireplumber.service"
      ]))
          .stdout
          .toString()
          .trim());
      if (pid == wireplumberPid) {
        return false;
      }
    }
    return lines.isNotEmpty;
  }

  yield await checkVid();
  await for (final _ in stdoutStream) {
    yield await checkVid();
  }
}

@freezed
class DevicesUsedData with _$DevicesUsedData {
  const factory DevicesUsedData({
    required bool microphone,
    required bool camera,
    required bool screen,
  }) = _DevicesUsedData;

  factory DevicesUsedData.fromJson(Map<String, Object?> json) => _$DevicesUsedDataFromJson(json);
}

@Riverpod(keepAlive: true)
class DevicesUsed extends _$DevicesUsed {
  final usingMicIDs = <int>{};
  final usingCameraIDs = <int>{};
  final usingScreenIDs = <int>{};

  @override
  DevicesUsedData build() {
    final l4v2Used = ref.watch(_l4v2UsedProvider);
    final pwDump = ref.watch(pipewireChangedJsonProvider);
    // final changedIds = pwDump.value?.map((e) => e["id"] as int).toSet();
    // final aa = ref.watch(testProvider);
    // print(changedIds);
    // print(aa.value);
    pwDump.listen((event) {
      for (final json in event) {
        final mediaClass = json["info"]?["props"]?["media.class"];
        if (mediaClass == "Audio/Source") {
          assert(json.containsKey("id"));
          final isRunning = json["info"]?["state"] == "running";

          if (isRunning) {
            usingMicIDs.add(json["id"] as int);
          } else {
            usingMicIDs.remove(json["id"] as int);
          }
        } else if (json["info"]?["props"]?["media.role"] == "Camera") {
          assert(json.containsKey("id"));
          final isRunning = json["info"]?["state"] == "running";

          if (isRunning) {
            usingCameraIDs.add(json["id"] as int);
          } else {
            usingCameraIDs.remove(json["id"] as int);
          }
        } else if (mediaClass == "Video/Source") {
          // Can also be Camera but we already covered it.
          assert(json.containsKey("id"));
          final isRunning = json["info"]?["state"] == "running";

          if (isRunning) {
            usingScreenIDs.add(json["id"] as int);
          } else {
            usingScreenIDs.remove(json["id"] as int);
          }
        } else if (json["info"] == null) {
          usingMicIDs.remove(json["id"] as int);
          usingCameraIDs.remove(json["id"] as int);
          usingScreenIDs.remove(json["id"] as int);
        }
        state = state.copyWith(
          microphone: usingMicIDs.isNotEmpty,
          camera: (l4v2Used.value ?? false) || usingCameraIDs.isNotEmpty,
          screen: usingScreenIDs.isNotEmpty,
        );
      }
    });

    return DevicesUsedData(
      microphone: usingMicIDs.isNotEmpty,
      camera: (l4v2Used.value ?? false) || usingCameraIDs.isNotEmpty,
      screen: usingScreenIDs.isNotEmpty,
    );
  }
}
