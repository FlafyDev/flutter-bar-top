import 'dart:convert';
import 'dart:io';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bar_commands.g.dart';

abstract class BarCommand {
  final List<String> params;

  const BarCommand(this.params);

  static BarCommand fromString(String command) {
    final parts = command.trim().split(" ");
    switch (parts[0]) {
      case "open":
        return BarCommandOpen(parts);
      case "toggle":
        return BarCommandToggle(parts);
      default:
        throw "Unknown command";
    }
  }
}

class BarCommandOpen extends BarCommand {
  const BarCommandOpen(super.params) : assert(params.length == 1);
}

class BarCommandToggle extends BarCommand {
  const BarCommandToggle(super.params) : assert(params.length == 1);
}

@Riverpod(keepAlive: true)
Stream<BarCommand> barCommands(BarCommandsRef ref) async* {
  final file = File("/tmp/bar-0");
  if (file.existsSync()) {
    file.deleteSync();
  }
  final socket = await ServerSocket.bind(InternetAddress(file.path, type: InternetAddressType.unix), 0);
  await for (final event in socket) {
    final str = utf8.decode(await event.single);
    if (str.startsWith(">")) {
      yield BarCommand.fromString(str.substring(1));
    }
  }
}

