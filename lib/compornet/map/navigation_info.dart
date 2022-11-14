import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/map_state.dart';
import '../../provider/general_provider.dart';

class NavigationInfo extends HookConsumerWidget {
  const NavigationInfo({super.key, required this.myLocation});
  final MapState myLocation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapVeiwState = ref.watch(mapNaviProvider);
    final mapViewController = ref.watch(mapNaviProvider.notifier);
    final navigatingController = ref.watch(navigatingShellterProvider.notifier);
    final polylineController = ref.watch(polylineControllerProvider.notifier);
    final mapTest = ref.watch(mapControllerProvider.notifier);
    final googleMapState = ref.watch(googleMapControllerProvider);
    final location = ref.watch(realTimeLocationCTLProvider);

    return mapVeiwState == MapNavi.navigation
        ? Align(
            alignment: const Alignment(0, 1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    mapViewController.state = MapNavi.list;
                    navigatingController.state = null;
                    polylineController.resetPolyline();
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    margin: const EdgeInsets.only(left: 10, bottom: 15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                      border: Border.all(
                        width: 3,
                        color: Colors.white,
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.close_rounded,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    // await mapTest.initNavigation(
                    //   googleMapState!,
                    //   LatLng(
                    //     location.latitude,
                    //     location.longitude,
                    //   ),
                    // );
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                      border: Border.all(
                        width: 3,
                        color: Colors.white,
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.my_location_sharp,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 70,
                      margin: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        bottom: 10,
                        top: 15,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(200),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: const [
                          Text(
                            "25min",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 25),
                          Text(
                            "5km",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 10,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 60,
                      bottom: 12,
                      child: Container(
                        width: 80,
                        height: 66,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Positioned(
                      right: 23,
                      bottom: 28,
                      child: Center(
                        child: Icon(
                          Icons.near_me_outlined,
                          color: Colors.white,
                          size: 60,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        : const SizedBox();
  }
}
