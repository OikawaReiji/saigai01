import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/compornet/map/search_bar.dart';
import 'package:saigai01/provider/general_provider.dart';
import '../../../compornet/map/address_panel.dart';
import '../../../compornet/map/bottom_panel.dart';
import '../../../compornet/map/google_map_core.dart';
import '../../../compornet/map/loading.dart';
import '../../../compornet/map/navigation_info.dart';
import '../../../compornet/map/route_panel.dart';

class MapPage extends HookConsumerWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapState = ref.watch(mapControllerProvider);

    return mapState.when(
      data: (data) {
        final shellterState = ref.watch(shellterControllerProvider(data));
        final CameraPosition cameraPos = CameraPosition(
          target: LatLng(
            data.latitude,
            data.longitude,
          ),
          zoom: 15,
        );
        final pageController = PageController(
          viewportFraction: 0.94,
        );
        return Stack(
          children: [
            GoogleMapCore(
              cameraPos: cameraPos,
              pageController: pageController,
              shellterState: shellterState,
            ),
            SearchBar(
              cameraPos: cameraPos,
              shellterState: shellterState,
              pageController: pageController,
            ),
            BottomPanel(
              cameraPos: cameraPos,
              shellterState: shellterState,
              pageController: pageController,
              myLocation: data,
            ),
            const AddressPanel(),
            NavigationInfo(
              myLocation: data,
            ),
            const Loading(),
            RoutePanel(
              myLocation: data,
            ),
          ],
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      error: (e, s) {
        return const Center(
          child: Text("エラー"),
        );
      },
    );
  }
}
