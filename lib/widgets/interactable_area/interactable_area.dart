// ignore_for_file: prefer_const_constructors

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bar_top/main.dart';
import 'package:flutter_bar_top/utils/input_utils.dart';
import 'package:flutter_bar_top/utils/use_listener_effect.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class InteractableArea extends HookConsumerWidget {
  InteractableArea({
    required this.child,
    int? id,
    super.key,
  }) {
    this.id = id ?? Random().nextInt(100000000); // TODO: switch to uuid ?
  }

  final Widget child;
  late final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rect = useValueNotifier(Rect.zero);

    useEffect(() {
      return () {
        InputUtils.removeMouseRegion(id);
      };
    }, []);

    useListenerEffect([
      rect
    ], callback: () {
      if (rect.value == Rect.zero) return;

      InputUtils.addMouseRegion(
        id,
        rect.value,
      );
    });

    return Container(
      // color: Colors.red.withOpacity(0.5),
      child: ChildListenRect(
        child: child,
        onChildRectChanged: (newRect) {
          rect.value = newRect;
        },
      ),
    );
  }
}

class ChildListenRect extends SingleChildRenderObjectWidget {
  final void Function(Rect)? onChildRectChanged;

  const ChildListenRect({
    Key? key,
    required Widget child,
    this.onChildRectChanged,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderChildListenRect().._widget = this;
  }

  @override
  void updateRenderObject(BuildContext context, RenderChildListenRect renderObject) {
    renderObject._widget = this;
  }
}

class RenderChildListenRect extends RenderBox with RenderObjectWithChildMixin<RenderBox> {
  var _lastSize = Size.zero;
  var _lastPosition = Offset.zero;
  ChildListenRect? _widget;

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
      context.paintChild(child, offset);
    }
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return child?.hitTest(result, position: position) == true;
  }
}
