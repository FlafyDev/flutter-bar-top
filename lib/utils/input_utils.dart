import 'package:flutter/services.dart';

class InputUtils {
  static const _myMethodChannel = MethodChannel('general');

  static Future<void> addMouseRegion(int id, Rect rect) async {
    await _myMethodChannel.invokeMethod('add_mouse_region', {
      'id': id,
      'x': rect.left.toInt(),
      'y': rect.top.toInt(),
      'width': rect.width.toInt(),
      'height': rect.height.toInt(),
    });
  }

  static Future<void> removeMouseRegion(int id) async {
    await _myMethodChannel.invokeMethod('remove_mouse_region', {
      'id': id,
    });
  }

  static Future<void> clearMouseRegions() async {
    await _myMethodChannel.invokeMethod('clear_mouse_regions');
  }

  static Future<void> setInput(bool recieve) async {
    await _myMethodChannel.invokeMethod('set_input', {
      'recieve': recieve,
    });
  }
}
