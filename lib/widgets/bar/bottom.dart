import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bar_top/providers/devices_used.dart';
import 'package:flutter_bar_top/providers/mpd.dart';
import 'package:flutter_bar_top/providers/pc_info.dart';
import 'package:flutter_bar_top/providers/pipewire_json_state.dart';
import 'package:flutter_bar_top/utils/timer_stream.dart';
import 'package:flutter_bar_top/widgets/blurred_background/blurred_background.dart';
import 'package:flutter_bar_top/widgets/interactable_area/interactable_area.dart';
import 'package:flutter_bar_top/widgets/smooth_graph/smooth_graph.dart';
import 'package:flutter_bar_top/widgets/smooth_graph_2/smooth_graph.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';

class BarBottom extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const height = 48 / 2;

    useEffect(() {
      // add_mouse_region(2, const Rect.fromLTWH(0, 1080-120, 1920, 120));
      return;
    }, []);

    final aa = useState(1.0);

    useEffect(() {
      timerStream(const Duration(milliseconds: 300)).listen(
        (e) {
          aa.value = aa.value <= 0 ? 0.9 : Random().nextDouble();
        },
      );
      return;
    }, []);

    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            height: height,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: Colors.grey.withOpacity(0.3),
                ),
              ),
            ),
            child: InteractableArea(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  const BlurredBackground(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          const Row(
                            children: [
                              Text("3", style: TextStyle(fontSize: 12, color: Colors.grey)),
                              SizedBox(width: 5),
                              Text("10", style: TextStyle(fontSize: 14)),
                            ],
                          ),
                          Consumer(
                            builder: (context, ref, child) {
                              final used = ref.watch(devicesUsedProvider);
                              final anyUsed = used.microphone || used.camera || used.screen;
                              return Row(
                                children: [
                                  if (anyUsed)
                                    Container(
                                      color: Color.fromARGB(255, 90, 90, 90),
                                      width: 1,
                                      height: 14,
                                      margin: const EdgeInsets.symmetric(horizontal: 6),
                                    ),
                                  if (used.microphone)
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 0),
                                      child: Icon(
                                        Icons.mic_none_outlined,
                                        size: 18,
                                        color: Colors.green,
                                      ),
                                    ),
                                  if (used.camera)
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 2),
                                      child: Icon(
                                        Icons.photo_camera_outlined,
                                        size: 18,
                                        color: Colors.green,
                                      ),
                                    ),
                                  if (used.screen)
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 3),
                                      child: Icon(
                                        Icons.monitor_outlined,
                                        size: 18,
                                        color: Colors.green,
                                      ),
                                    ),
                                ],
                              );
                            },
                          ),
                          Container(
                            color: Color.fromARGB(255, 90, 90, 90),
                            width: 1,
                            height: 14,
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                          ),
                          Icon(Icons.volume_off_outlined, size: 16, color: Colors.white),
                          const SizedBox(width: 6),
                          Container(color: Color.fromARGB(255, 90, 90, 90), width: 1, height: 14),
                          const SizedBox(width: 6),
                          Icon(Icons.lan_outlined, size: 16, color: Colors.white),
                          const SizedBox(width: 6),
                          Icon(Icons.bluetooth_outlined, size: 16, color: Colors.white),
                          const SizedBox(width: 6),
                          Container(color: Color.fromARGB(255, 90, 90, 90), width: 1, height: 14),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Icon(Icons.memory, size: 16, color: Colors.white),
                          ),
                          Container(
                            width: 50,
                            color: Colors.black.withOpacity(0.2),
                            child: Consumer(
                              builder: (context, ref, child) {
                                final cpu = ref.watch(pCInfoHistoryProvider.select((m) => m.cpuUsage));
                                return SmoothGraph(
                                  borderRadius: 5,
                                  ballSize: 4,
                                  refreshRate: const Duration(milliseconds: 400),
                                  ballGlowMultiplier: 1 / 4,
                                  valueHistory: [ cpu ],
                                  latestValue: [ cpu.last ],
                                  lowestMaxValue: 1.1,
                                  topValueSpacing: 1.1,
                                  tint: cpu.last >= 0.8 ? Colors.red : Colors.grey,
                                );
                              },
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            color: Color.fromARGB(255, 90, 90, 90),
                            width: 1,
                            height: 14,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: SvgPicture.asset(
                              "assets/icons/gpu2.svg",
                              height: 18,
                              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                            ),
                            // child: Image(
                            //   image: AssetImage("assets/icons/gpu.png"),
                            //   width: 16,
                            //   height: 16,
                            // ),
                          ),
                          Container(
                            width: 50,
                            color: Colors.black.withOpacity(0.2),
                            child: Consumer(builder: (context, ref, child) {
                              final gpusUsage = ref.watch(pCInfoHistoryProvider.select((m) => m.gpusUsage));
                              if (gpusUsage.isEmpty) return Container();
                              final colors = [
                                Colors.blue,
                                Colors.yellow,
                              ];
                              final usages = gpusUsage.values.toList().reversed.toList();
                              return SmoothGraph(
                                key: ValueKey("gpus-${gpusUsage.keys.join()}"),
                                borderRadius: 5,
                                ballSize: 4,
                                refreshRate: const Duration(milliseconds: 400),
                                ballGlowMultiplier: 1 / 4,
                                valueHistory: usages,
                                latestValue: usages.map((e) => e.last).toList(),
                                lowestMaxValue: 1.1,
                                topValueSpacing: 1.1,
                                tint: usages.any((e) => e.last >= 0.8) ? Colors.red : Colors.grey,
                                graphsTint: usages.mapIndexed((i, e) => e.last >= 0.8 ? colors[i % colors.length] : colors[i % colors.length]).toList(),
                              );
                            }),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            color: Color.fromARGB(255, 90, 90, 90),
                            width: 1,
                            height: 14,
                          ),
                          HookConsumer(
                            builder: (context, ref, child) {
                              final title = ref.watch(mpdStateProvider.select((m) => m.title));
                              final progress = ref.watch(
                                mpdStateProvider.select(
                                  (m) => (m.elapsed?.inMilliseconds ?? 0) / (m.duration?.inMilliseconds ?? 1),
                                ),
                              );
                              final isPlaying = ref.watch(mpdStateProvider.select((m) => m.isPlaying));
                              return Stack(
                                children: [
                                  Positioned.fill(
                                    child: LayoutBuilder(builder: (context, constraints) {
                                      return Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(horizontal: 3),
                                          width: (constraints.maxWidth - 3 * 2) * progress,
                                          height: 2,
                                          decoration: BoxDecoration(
                                            color: isPlaying ? const Color.fromARGB(255, 210, 210, 210) : Colors.grey,
                                            borderRadius: const BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.music_note,
                                          size: 16,
                                          color: isPlaying ? Colors.white : Colors.grey,
                                        ),
                                        const SizedBox(width: 2),
                                        Text(
                                          title ?? "",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: isPlaying ? Colors.white : Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            color: Color.fromARGB(255, 90, 90, 90),
                            width: 1,
                            height: 14,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: HookConsumer(builder: (context, ref, child) {
                        final ticker = useSingleTickerProvider();
                        final time = useState(DateTime.now());
                        useEffect(() {
                          final startTime = DateTime.now();
                          final tk = ticker.createTicker((elapsed) {
                            final newTime = startTime.add(elapsed);
                            if (newTime.minute != time.value.minute) {
                              time.value = newTime;
                            }
                          });
                          tk.start();
                          return () {
                            tk.dispose();
                          };
                        }, [
                          ticker,
                          time
                        ]);

                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              DateFormat('HH:mm').format(time.value),
                              style: const TextStyle(fontSize: 12),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              DateFormat('dd/MM/yyyy').format(time.value),
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
