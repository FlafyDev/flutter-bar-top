// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bar_top/providers/devices_used.dart';
import 'package:flutter_bar_top/providers/pipewire_json_state.dart';
import 'package:flutter_bar_top/utils/input_utils.dart';
import 'package:flutter_bar_top/utils/timer_stream.dart';
import 'package:flutter_bar_top/widgets/bar/bottom.dart';
import 'package:flutter_bar_top/widgets/bar/popup.dart';
import 'package:flutter_bar_top/widgets/blurred_background/blurred_background.dart';
import 'package:flutter_bar_top/widgets/interactable_area/interactable_area.dart';
import 'package:flutter_bar_top/widgets/smooth_graph/smooth_graph.dart';
import 'package:flutter_bar_top/widgets/smooth_graph_2/smooth_graph.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:window_manager/window_manager.dart';

import 'providers/pc_info.dart';

class MyObserver extends ProviderObserver {
  // @override
  // void didAddProvider(
  //   ProviderBase<Object?> provider,
  //   Object? value,
  //   ProviderContainer container,
  // ) {
  //   print('Provider $provider was initialized with $value');
  // }
  //
  // @override
  // void didDisposeProvider(
  //   ProviderBase<Object?> provider,
  //   ProviderContainer container,
  // ) {
  //   print('Provider $provider was disposed');
  // }
  //
  // @override
  // void didUpdateProvider(
  //   ProviderBase<Object?> provider,
  //   Object? previousValue,
  //   Object? newValue,
  //   ProviderContainer container,
  // ) {
  //   print('Provider $provider updated from $previousValue to $newValue');
  // }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    print('Provider $provider threw $error at $stackTrace');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();
  runApp(
    ProviderScope(
      observers: [
        MyObserver()
      ],
      child: _EagerInitialization(
        child: _HomePage(),
      ),
    ),
  );
}

class _EagerInitialization extends ConsumerWidget {
  const _EagerInitialization({
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(devicesUsedProvider);
    return child;
  }
}

class _HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> with WindowListener {
  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyApp();
  }

  @override
  void onWindowFocus() {
    print("Window focused");
  }

  @override
  void onWindowBlur() {
    print("Window unfocused");
  }
}

class MyApp extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final barPopupState = ref.watch(barPopupStateProvider.notifier.select((value) => value.state)).state;
    final a = useState(List.generate(100, (index) => index/10.0 % 1));
    useEffect(() {
      // add_mouse_region(1, const Rect.fromLTWH(0, 0, 200, 200));
      print("clearing regions");
      // setInput(true);

      (() async {
        while (true) {
          // set_input(a);
          // print(set_input(a));
          // a = !a;
          await Future.delayed(const Duration(milliseconds: 100));
          final newval = a.value.last + 0.1;
          a.value = [...a.value.skip(1), newval > 1.0 ? 0.0 : newval];
          // print(a.value.last);
        }
      })();

      InputUtils.clearMouseRegions();
      return;
    }, []);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: Colors.transparent,
        colorScheme: ColorScheme.dark(
          primary: Colors.white,
          secondary: Colors.white,
        ),
      ),
      home: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(child: BarBottom()),
            Positioned.fill(child: BarPopup()),
            // Positioned.fill(
            //   child: Align(
            //     alignment: Alignment.centerRight,
            //     child: Container(
            //       width: 600,
            //       height: 200,
            //       decoration: BoxDecoration(
            //         border: Border.all(
            //           color: Colors.white,
            //         ),
            //         color: Colors.black,
            //       ),
            //       padding: const EdgeInsets.all(10),
            //       child: Container(
            //         // padding: const EdgeInsets.only(left: 200, right: 300),
            //         child: Consumer(builder: (context, ref, child) {
            //           final cpu = ref.watch(cpuLoadHistoryProvider);
            //           return SmoothGraph(
            //             borderRadius: 5,
            //             ballSize: 12,
            //             refreshRate: const Duration(milliseconds: 500),
            //             animate: true,
            //             valueHistory: cpu,
            //             latestValue: cpu.last,
            //             lowestMaxValue: 1.0,
            //             topValueSpacing: 0,
            //             tint: cpu.last >= 0.8 ? Colors.red : Colors.grey,
            //             futurePoints: 1,
            //             pastPoints: 3,
            //           );
            //         }),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}


// class BarModule extends StatelessWidget {
//   const BarModule({
//     super.key,
//     this.child,
//     this.width,
//     this.height,
//     this.leftConnection = false,
//     this.rightConnection = false,
//   });
//
//   final Widget? child;
//   final double? width;
//   final double? height;
//   final bool leftConnection;
//   final bool rightConnection;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       height: height,
//       margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 1).copyWith(
//         bottom: 0,
//       ),
//       decoration: BoxDecoration(
//         color: Colors.black.withOpacity(0.4),
//         border: Border(
//           bottom: BorderSide(
//             color: Color.fromARGB(255, 30, 30, 30),
//             width: 0.1,
//           ),
//           top: BorderSide(color: Color.fromARGB(255, 30, 30, 30), width: 0.5),
//           left: BorderSide(color: Color.fromARGB(255, 30, 30, 30)),
//           right: BorderSide(color: Color.fromARGB(255, 30, 30, 30)),
//         ),
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(leftConnection ? 0 : 20),
//           bottomLeft: Radius.circular(leftConnection ? 0 : 0),
//           topRight: Radius.circular(rightConnection ? 0 : 20),
//           bottomRight: Radius.circular(rightConnection ? 0 : 0),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.2),
//             spreadRadius: 1,
//             blurRadius: 2,
//             offset: const Offset(0, 1),
//           ),
//         ],
//       ),
//       child: child,
//     );
//   }
// }
