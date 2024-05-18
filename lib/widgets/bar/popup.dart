import 'package:flutter/material.dart';
import 'package:flutter_bar_top/main.dart';
import 'package:flutter_bar_top/providers/bar_popup_state.dart';
import 'package:flutter_bar_top/utils/input_utils.dart';
import 'package:flutter_bar_top/widgets/blurred_background/blurred_background.dart';
import 'package:flutter_bar_top/widgets/interactable_area/interactable_area.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BarPopup extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showAC = useAnimationController(
      duration: const Duration(milliseconds: 400),
      initialValue: 1,
    );

    const popupHeight = 300.0;
    const popupWidth = 800.0;

    final barPopupOpen = ref.watch(barPopupStateProvider.select((value) => value.open));

    useEffect(() {
      showAC.animateTo(barPopupOpen ? 0 : 1, curve: Curves.easeOutExpo);
      InputUtils.setInput(barPopupOpen);
      return;
    }, [
      barPopupOpen
    ]);

    return Align(
      alignment: Alignment.bottomCenter,
      // alignment: Alignment.center,
      child: SizedBox(
        width: popupWidth + 100,
        height: popupHeight + 30,
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: showAC,
              builder: (context, child) {
                return Positioned(
                  top: 50 + (showAC.value * (popupHeight - 10)).roundToDouble(),
                  left: 50,
                  width: popupWidth,
                  height: popupHeight,
                  child: Container(
                    decoration: BoxDecoration(
                      // color: Colors.deepPurple,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.7),
                          blurRadius: 20,
                          spreadRadius: 2,
                        ),
                      ],
                      // color: Colors.black,
                      border: const Border(
                        top: BorderSide(width: 1, color: Color(0xFF878cc6)),
                        left: BorderSide(width: 1, color: Color(0xFF878cc6)),
                        right: BorderSide(width: 1, color: Color(0xFF878cc6)),
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      children: [
                        // Positioned(
                        //   left: 1920,
                        //   // top: 1080 - 50 + 3 * 2 + 1,
                        //   top: 0,
                        //   child: Image(
                        //     image: AssetImage("assets/background-blur.jpg"),
                        //     // image: FileImage(File("/home/flafy/repos/flafydev/assets/wallpapers/windows11-flower/windows11-flower.jpg")),
                        //   ),
                        // ),
                        BlurredBackground(),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  color: Colors.black.withOpacity(0.2),
                                ),
                                width: double.infinity,
                                height: 30,
                                padding: EdgeInsets.only(left: 10),
                                child: TextField(
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
                                  textAlignVertical: TextAlignVertical.bottom,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter a search term',
                                  ),
                                  autofocus: true,
                                ),
                              ),
                              SizedBox(height: 6),
                              Container(color: Color.fromARGB(100, 90, 90, 90), width: double.infinity, height: 1),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
