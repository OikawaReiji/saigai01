import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../constant/hex_color.dart';
import '../../model/map/map_state.dart';
import '../../model/shellter/shellter.dart';
import '../../provider/general_provider.dart';
import '../../view/pages/map/shellter_detail.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class BottomPanel extends HookConsumerWidget {
  const BottomPanel({
    super.key,
    required this.cameraPos,
    required this.shellterState,
    required this.pageController,
    required this.myLocation,
  });
  final CameraPosition cameraPos;
  final ShellterList shellterState;
  final PageController pageController;
  final MapState myLocation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailsController = ref.watch(detailsProvider.notifier);
    final mapVeiwState = ref.watch(mapNaviProvider);
    final mapViewController = ref.watch(mapNaviProvider.notifier);
    final polylineController = ref.watch(polylineControllerProvider.notifier);
    final navigatingController = ref.watch(navigatingShellterProvider.notifier);
    final mapTest = ref.watch(mapControllerProvider.notifier);
    final googleMapState = ref.watch(googleMapControllerProvider);
    final markerCTL = ref.watch(markerControllerProvider.notifier);
    final matrixCTL = ref.watch(matrixControllerProvider.notifier);

    return mapVeiwState == MapNavi.list
        ? Align(
            alignment: const Alignment(0, 1),
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 160,
              child: PageView(
                controller: pageController,
                onPageChanged: (index) async {
                  final nextLat =
                      shellterState.features[index].geometry.coordinates;
                  markerCTL.updateMarkerId(nextLat[0].toString());
                  await googleMapState!.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: LatLng(nextLat[1], nextLat[0]),
                        zoom: 18,
                      ),
                    ),
                  );
                },
                children: shellterState.features.map(
                  ((state) {
                    return Container(
                      height: 160,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          width: 3,
                          color: Colors.white,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.properties.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                state.properties.location,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () async {
                                    mapViewController.state = MapNavi.loading;
                                    var connectivityResult =
                                        await (Connectivity()
                                            .checkConnectivity());
                                    if (connectivityResult ==
                                        ConnectivityResult.none) {
                                      mapViewController.state = MapNavi.list;
                                      return;
                                    }
                                    navigatingController.state = state;
                                    await polylineController.feachPolyline(
                                      PointLatLng(
                                        myLocation.latitude,
                                        myLocation.longitude,
                                      ),
                                      PointLatLng(
                                        state.geometry.coordinates[1],
                                        state.geometry.coordinates[0],
                                      ),
                                    );
                                    await matrixCTL.fechDistanceMatrix(
                                      PointLatLng(
                                        myLocation.latitude,
                                        myLocation.longitude,
                                      ),
                                      PointLatLng(
                                        state.geometry.coordinates[1],
                                        state.geometry.coordinates[0],
                                      ),
                                    );

                                    await mapTest.setCamera(
                                      LatLng(
                                        myLocation.latitude,
                                        myLocation.longitude,
                                      ),
                                      LatLng(
                                        state.geometry.coordinates[1],
                                        state.geometry.coordinates[0],
                                      ),
                                      googleMapState!,
                                    );
                                    mapViewController.state = MapNavi.route;
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: HexColor("#FF8A30"),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "経路を表示",
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
                              const SizedBox(width: 5),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    detailsController.state = state;
                                    Navigator.pushNamed(
                                        context, ShellterDetails.id);
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
                                        "詳細をみる",
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
                    );
                  }),
                ).toList(),
              ),
            ),
          )
        : const SizedBox();
  }
}
