import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../constant/hex_color.dart';
import '../../../model/shellter/shellter.dart';
import '../../../provider/general_provider.dart';

class MapSearch extends HookConsumerWidget {
  const MapSearch({
    super.key,
    required this.list,
    required this.shellterState,
    required this.pageController,
  });
  static String id = "map_search";
  final Iterable<String> list;
  final ShellterList shellterState;
  final PageController pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final googleMapState = ref.watch(googleMapControllerProvider);

    Future<void> test(Function() function, String name) async {
      final aaa = shellterState.features
          .where((element) => element.properties.name == name)
          .first;

      int index = shellterState.features.indexOf(aaa);
      pageController.jumpToPage(index);

      final nextLat = shellterState.features[index].geometry.coordinates;

      await googleMapState!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(nextLat[1], nextLat[0]),
            zoom: 15,
          ),
        ),
      );
      await function();
    }

    return Scaffold(
      backgroundColor: HexColor("#3F3F3F"),
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(0, -1),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 60,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child: Autocomplete(
                      optionsBuilder: (textEditingValue) {
                        if (textEditingValue.text == '') {
                          return const Iterable<String>.empty();
                        }
                        return list.where((String option) {
                          return option
                              .contains(textEditingValue.text.toLowerCase());
                        });
                      },
                      fieldViewBuilder: (context, textEditingController,
                          focusNode, onFieldSubmitted) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            autofocus: true,
                            focusNode: focusNode,
                            controller: textEditingController,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                            ),
                            decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                  size: 35,
                                ),
                                hintText: "避難所名",
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 138, 138, 138)),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none),
                          ),
                        );
                      },
                      optionsMaxHeight: 0,
                      optionsViewBuilder: (
                        BuildContext context,
                        AutocompleteOnSelected<String> onSelected,
                        Iterable<String> options,
                      ) {
                        return Align(
                          alignment: Alignment.topLeft,
                          child: Material(
                            color: Colors.black.withOpacity(0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width - 20,
                              child: ListView.builder(
                                itemCount: options.length,
                                itemBuilder: (context, index) {
                                  final option = options.elementAt(index);
                                  return GestureDetector(
                                    onTap: () async => test(() {
                                      Navigator.pop(context);
                                    }, option),
                                    child: Container(
                                      height: 50,
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Colors.white,
                                            width: 0.3,
                                          ),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            option,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
