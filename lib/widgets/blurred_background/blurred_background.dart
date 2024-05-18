// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bar_top/main.dart';
import 'package:flutter_bar_top/utils/use_listener_effect.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class BlurredBackground extends HookConsumerWidget {
  const BlurredBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rect = useValueNotifier(Rect.zero);

    return Container(
      // color: Colors.red.withOpacity(0.5),
      child: _ChildListenRect(
        child: ValueListenableBuilder(
            valueListenable: rect,
            builder: (context, rect, child) {
              return Stack(
                children: [
                  Positioned(
                    left: -rect.left,
                    // left: 0,
                    // top: 1080 - 50 + 3 * 2 + 1,
                    top: -rect.top,
                    // top: 0,
                    // child: Container(color: Colors.black)
                    child: Image(
                      image: AssetImage("assets/background-blur.jpg"),
                      // image: FileImage(File("/home/flafy/repos/flafydev/assets/wallpapers/windows11-flower/windows11-flower.jpg")),
                    ),
                  ),
                  Positioned.fill(child: Container(color: Colors.black.withOpacity(0.6))),
                ],
              );
            }),
        onChildRectChanged: (newRect) {
          WidgetsBinding.instance.addPostFrameCallback((d) {
            rect.value = newRect;
          });
        },
      ),
    );
  }
}

class _ChildListenRect extends SingleChildRenderObjectWidget {
  final void Function(Rect)? onChildRectChanged;

  const _ChildListenRect({
    Key? key,
    required Widget child,
    this.onChildRectChanged,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderChildListenRect().._widget = this;
  }

  @override
  void updateRenderObject(BuildContext context, _RenderChildListenRect renderObject) {
    renderObject._widget = this;
  }
}

class _RenderChildListenRect extends RenderBox with RenderObjectWithChildMixin<RenderBox> {
  var _lastSize = Size.zero;
  var _lastPosition = Offset.zero;
  _ChildListenRect? _widget;

  @override
  void performLayout() {
    final child = this.child;
    if (child != null) {
      child.layout(constraints, parentUsesSize: true);
      size = child.size;
    } else {
      size = constraints.smallest;
    }

    if (_lastSize != size) {
      _lastSize = size;
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    // This delta is a hack because the position will always be late by one frame.
    final delta = offset - _lastPosition;
    if ((_lastPosition != offset) && _widget != null) {
      _lastPosition = offset;

      _widget!.onChildRectChanged?.call(
        Rect.fromLTWH(
          _lastPosition.dx,
          _lastPosition.dy,
          _lastSize.width,
          _lastSize.height,
        ),
      );
    }

    final child = this.child;
    if (child != null) {
      context.paintChild(child, offset-delta);
    }
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return child?.hitTest(result, position: position) == true;
  }
}
