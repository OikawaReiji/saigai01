import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../model/shellter/shellter.dart';
import '../../provider/general_provider.dart';

class GoogleMapCore extends HookConsumerWidget {
  const GoogleMapCore({
    super.key,
    required this.cameraPos,
    required this.shellterState,
    required this.pageController,
  });
  final CameraPosition cameraPos;
  final ShellterList shellterState;
  final PageController pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final polyline = ref.watch(polylineControllerProvider);
    final mapVeiwState = ref.watch(mapNaviProvider);
    final navigatingState = ref.watch(navigatingShellterProvider.notifier);
    final googleMapCTL = ref.watch(googleMapControllerProvider.notifier);
    final marker = ref.watch(markerControllerProvider);
    final markerCTL = ref.watch(markerControllerProvider.notifier);

    return GoogleMap(
      minMaxZoomPreference: const MinMaxZoomPreference(0, 16),
      initialCameraPosition: cameraPos,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      mapType: MapType.normal,
      myLocationEnabled: true,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 50, bottom: 160),
      onMapCreated: (GoogleMapController controller) async {
        googleMapCTL.onMapCreated(controller);
      },
      polylines:
          mapVeiwState == MapNavi.navigation || mapVeiwState == MapNavi.route
              ? {
                  Polyline(
                    width: 5,
                    color: Colors.red,
                    polylineId: const PolylineId("a"),
                    points: List.generate(
                      polyline.length,
                      (index) => LatLng(
                        polyline[index].latitude,
                        polyline[index].longitude,
                      ),
                    ),
                  ),
                }
              : {},
      markers: mapVeiwState == MapNavi.list
          ? {
              ...shellterState.features.map(
                (selectedShellter) {
                  return Marker(
                    markerId: MarkerId(
                        selectedShellter.geometry.coordinates[0].toString()),
                    position: LatLng(selectedShellter.geometry.coordinates[1],
                        selectedShellter.geometry.coordinates[0]),
                    icon: marker!.markerId ==
                            selectedShellter.geometry.coordinates[0].toString()
                        ? marker.mapIconSelected!
                        : marker.mapIcon!,
                    onTap: () async {
                      final index = shellterState.features.indexWhere(
                          (shellter) => shellter == selectedShellter);
                      markerCTL.updateMarkerId(
                          selectedShellter.geometry.coordinates[0].toString());
                      pageController.jumpToPage(index);
                    },
                  );
                },
              ).toSet(),
            }
          : mapVeiwState == MapNavi.navigation || mapVeiwState == MapNavi.route
              ? {
                  Marker(
                    markerId: MarkerId(navigatingState
                        .state!.geometry.coordinates[0]
                        .toString()),
                    position: LatLng(
                        navigatingState.state!.geometry.coordinates[1],
                        navigatingState.state!.geometry.coordinates[0]),
                    icon: BitmapDescriptor.defaultMarker,
                    onTap: () async {
                      final index = shellterState.features.indexWhere(
                          (shellter) => shellter == navigatingState.state);
                      pageController.jumpToPage(index);
                    },
                  ),
                }
              : {},
    );
  }
}
