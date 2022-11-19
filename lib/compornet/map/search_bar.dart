import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/shellter.dart';
import '../../provider/general_provider.dart';
import '../../view/pages/map/map_search.dart';

class SearchBar extends HookConsumerWidget {
  const SearchBar({
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
    final nameList = shellterState.features.map((e) => e.properties.name);
    final mapVeiwState = ref.watch(mapNaviProvider);
    return mapVeiwState == MapNavi.list
        ? Align(
            alignment: const Alignment(0, -1),
            child: SafeArea(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MapSearch(
                        list: nameList,
                        shellterState: shellterState,
                        pageController: pageController,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 45,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}
