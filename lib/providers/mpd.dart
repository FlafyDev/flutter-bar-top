import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:dart_mpd/dart_mpd.dart' show MpdClient, MpdConnectionDetails, MpdSubsystem;
import 'package:dart_mpd/dart_mpd.dart' as mpd;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mpd.freezed.dart';
part 'mpd.g.dart';

@freezed
class MpdData with _$MpdData {
  const factory MpdData({
    String? title,
    String? artist,
    Duration? duration,
    Duration? elapsed,
    DateTime? fetchedElapsed,
    double? volume,
    required bool isPlaying,
  }) = _MpdData;

  factory MpdData.fromJson(Map<String, Object?> json) => _$MpdDataFromJson(json);
}

@riverpod
class MpdState extends _$MpdState {
  late final MpdClient _mpdClient = MpdClient(
    // connectionDetails: MpdConnectionDetails.resolve(),
    connectionDetails: const MpdConnectionDetails(
      host: "10.0.0.2",
      port: 6600,
      timeout: Duration(seconds: 5),
    ),
    onConnect: _connectedToMpd,
  );

  @override
  MpdData build() {
    // _mpdClient.connection.connect();
    _mpdClient.getvol();
    // ref.onDispose(_mpdClient.connection.close);

    return const MpdData(
      isPlaying: false,
    );
  }

  Future<void> _updateSong() async {
    final currentSong = await _mpdClient.currentsong();
    final status = await _mpdClient.status();
    if (currentSong == null || status.state == mpd.MpdState.stop) {
      state = const MpdData(
        isPlaying: false,
      );
      return;
    }
    // final status = await _mpdClient.status();
    state = state.copyWith(
      title: currentSong.title?.first ?? "",
      artist: currentSong.artist?.first ?? "",
      duration: currentSong.duration,
      elapsed: status.elapsed != null ? Duration(milliseconds: (status.elapsed! * 1000).round()) : null,
      fetchedElapsed: DateTime.now(),
      // elapsed: currentSong.elapsed,
      isPlaying: status.state == mpd.MpdState.play,
    );
  }

  Future<void> _updateVolume() async {
    final volume = await _mpdClient.getvol();
    state = state.copyWith(volume: volume?.toDouble());
  }

  void _updateElapsed() {
    if (state.elapsed != null && state.isPlaying) {
      state = state.copyWith(
        elapsed: Duration(
          milliseconds: min(
            state.duration!.inMilliseconds,
            state.elapsed!.inMilliseconds + DateTime.now().difference(state.fetchedElapsed!).inMilliseconds,
          ),
        ),
        fetchedElapsed: DateTime.now(),
      );
    }
  }

  void _connectedToMpd() async {
    print("connected");
    (() async {
      while (true) {
        await Future.delayed(const Duration(milliseconds: 200));
        _updateElapsed();
      }
    })();
    while (true) {
      await _updateVolume();
      await _updateSong();
      print(state);
      final events = await _mpdClient.idle({
        MpdSubsystem.player,
        MpdSubsystem.mixer,
      });
      for (final event in events) {
        switch (event) {
          case MpdSubsystem.player:
            await _updateSong();
            break;
          case MpdSubsystem.mixer:
            await _updateVolume();
            break;
          default:
            break;
        }
      }
    }
    // print(await _mpdClient.getvol());
    // await Future.delayed(Duration(seconds: 1));
    // await _mpdClient.idle({MpdSubsystem.mixer});
    // await _mpdClient.subscribe("player");
    // await _mpdClient.subscribe("mixer");
    // print(await _mpdClient.channels());
  }
}
