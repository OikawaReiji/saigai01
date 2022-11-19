import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/constant/hex_color.dart';

import '../../model/map_state.dart';
import '../../provider/general_provider.dart';

class RoutePanel extends HookConsumerWidget {
  const RoutePanel({super.key, required this.myLocation});
  final MapState myLocation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapVeiwState = ref.watch(mapNaviProvider);
    final mapViewController = ref.watch(mapNaviProvider.notifier);
    final polylineController = ref.watch(polylineControllerProvider.notifier);
    final navigatingController = ref.watch(navigatingShellterProvider.notifier);
    final mapTest = ref.watch(mapControllerProvider.notifier);
    final googleMapState = ref.watch(googleMapControllerProvider);

    return mapVeiwState == MapNavi.route
        ? Align(
            alignment: const Alignment(0, 1),
            child: SafeArea(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: "15分",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "(1.25km)",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              mapViewController.state = MapNavi.list;
                              navigatingController.state = null;
                              polylineController.resetPolyline();
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 3,
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  "もどる",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              await mapTest.initNavigation(
                                googleMapState!,
                                LatLng(
                                  myLocation.latitude,
                                  myLocation.longitude,
                                ),
                              );
                              mapViewController.state = MapNavi.navigation;
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: HexColor("#FF8A30"),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Center(
                                child: Text(
                                  "ナビ開始",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}
