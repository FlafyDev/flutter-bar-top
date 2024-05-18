import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:dart_mpd/dart_mpd.dart' show MpdClient, MpdConnectionDetails, MpdSubsystem;
import 'package:dart_mpd/dart_mpd.dart' as mpd;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pipewire_json_state.g.dart';

// Stream<List<Map<String, dynamic>>> pipewireChangedJsonFunc() async* {
//   final process = await Process.start("pw-dump", [
//     "-m"
//   ]);
//
//   final buffer = StringBuffer();
//   final stdoutStream = process.stdout.transform(utf8.decoder);
//
//   await for (final data in stdoutStream) {
//     buffer.write(data);
//
//     if (data.split("\n").where((l) => l.trim().isNotEmpty).last == "]") {
//       final jsonsStr = buffer.toString();
//       buffer.clear();
//       final res = <Map<String, dynamic>>[];
//       for (final jsonStr in jsonsStr.split("\n]").where((s) => s.trim().isNotEmpty)) {
//         res.addAll((jsonDecode("$jsonStr]") as List<dynamic>).map((e) => e as Map<String, dynamic>));
//       }
//       final changedIds = res.map((e) => e["id"] as int).toSet();
//       print("in prov $changedIds");
//       yield res;
//     }
//   }
// }

@Riverpod(keepAlive: true)
Raw<Stream<List<Map<String, dynamic>>>> pipewireChangedJson(PipewireChangedJsonRef ref) {
  Stream<List<Map<String, dynamic>>> stream() async* {
    final process = await Process.start("pw-dump", [
      "-m"
    ]);

    final buffer = StringBuffer();
    final stdoutStream = process.stdout.transform(utf8.decoder);

    await for (final data in stdoutStream) {
      buffer.write(data);

      if (data.split("\n").where((l) => l.trim().isNotEmpty).last == "]") {
        final jsonsStr = buffer.toString();
        buffer.clear();
        final res = <Map<String, dynamic>>[];
        for (final jsonStr in jsonsStr.split("\n]").where((s) => s.trim().isNotEmpty)) {
          res.addAll((jsonDecode("$jsonStr]") as List<dynamic>).map((e) => e as Map<String, dynamic>));
        }
        yield res;
      }
    }
  }
  return stream().asBroadcastStream();
}

// @riverpod
// Stream<bool> microphoneUsed(MicrophoneUsedRef ref) {
//   final pwDump = ref.watch(pipewireChangedJsonProvider);
//   pwDump.whenData((value) => null)
//
//   // print(pwDump.valueOrNull?.length);
//   // yield true;
//
//   // print(pwDump.value?.length);
//   if (pwDump.value == null) return false;
//   for (final json in pwDump.value!) {
//     // print(json);
//     // print(json["state"]);
//     // print(json["props"]?["media.class"]);
//     // print(json["state"] == "running" && json["props"]?["media.class"] == "Audio/Source");
//     final usesMic = json["info"]?["state"] == "running" && json["info"]?["props"]?["media.class"] == "Audio/Source";
//     print("usesMic: $usesMic");
//     if (usesMic) {
//       return true;
//     }
//   }
//   return false;
// }


// @Riverpod(keepAlive: true)
// Stream<List<Map<String, Object?>>> pipewireJson(PipewireJsonRef ref) async* {
//   final process = await Process.start("pw-dump", [
//     "-m"
//   ]);
//
//   final buffer = StringBuffer();
//   var stateJson = <Map<String, Object?>>[];
//   final stdoutStream = process.stdout.transform(utf8.decoder);
//
//   print("rerunning??");
//   await for (final data in stdoutStream) {
//     buffer.write(data);
//
//     // Check if the received data forms a complete JSON object
//     print("?");
//     if (buffer.toString().endsWith(']\n')) {
//       // If yes, process the JSON object
//       final jsonStr = buffer.toString();
//       if (jsonStr.length < 10000) {
//         print(jsonStr);
//       }
//       buffer.clear();
//
//       // You can now parse and use the JSON data
//       final startTime = DateTime.now();
//       final newJson = jsonDecode(jsonStr) as List<Map<String, Object?>>;
//
//       final changedIDs = newJson.map((j) => j["id"]);
//       stateJson = stateJson.where((j) => !changedIDs.contains(j["id"])).toList();
//       for (final idJson in newJson) {
//         stateJson.add(idJson);
//       }
//       final endTime = DateTime.now();
//       print("Time taken to parse JSON: ${endTime.difference(startTime).inMilliseconds}ms");
//       yield stateJson;
//     }
//   }
// }
