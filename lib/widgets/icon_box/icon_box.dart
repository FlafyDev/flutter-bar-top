import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class IconBox extends HookConsumerWidget {
  const IconBox(
    this.icon, {
    this.size,
    this.color,
    super.key,
  });

  final IconData icon;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: size,
      margin: EdgeInsets.symmetric(horizontal: 2),
      height: size,
      // color: Colors.red,
      child: Icon(
        icon,
        size: size,
        color: color,
      ),
    );
  }
}
