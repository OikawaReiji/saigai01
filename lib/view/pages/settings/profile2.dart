// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:saigai01/constant/hex_color.dart';
// import 'package:flutter/material.dart';

// import '../../../gen/assets.gen.dart';
// import '../../../provider/general_provider.dart';

// class DropdownButtonMenu extends StatefulWidget {
//   const DropdownButtonMenu({Key? key}) : super(key: key);

//   @override
//   State<DropdownButtonMenu> createState() => _DropdownButtonMenuState();
// }

// class _DropdownButtonMenuState extends State<DropdownButtonMenu> {
//   String isSelectedValue = 'safe';

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField(
//       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Color.fromARGB(255, 62, 60, 60),
//         prefixIcon: Icon(
//           Icons.person,
//           size: 40,
//         ),
//       ),
//       items: const [
//         DropdownMenuItem(
//           value: 'safe',
//           child: Text(
//             '安全',
//             style: TextStyle(
//               color: Color.fromARGB(255, 0, 254, 127),
//             ),
//           ),
//         ),
//         DropdownMenuItem(
//             value: 'nearsafe',
//             child: Text(
//               'やや安全',
//               style: TextStyle(
//                 color: Color.fromARGB(255, 11, 173, 11),
//               ),
//             )),
//         DropdownMenuItem(
//           value: 'nearded',
//           child: Text(
//             'やや危険',
//             style: TextStyle(
//               color: Color.fromARGB(255, 251, 167, 5),
//             ),
//           ),
//         ),
//         DropdownMenuItem(
//           value: 'ded',
//           child: Text(
//             '危険',
//             style: TextStyle(
//               color: Color.fromARGB(255, 251, 5, 5),
//             ),
//           ),
//         ),
//       ],
//       value: isSelectedValue,
//       onChanged: (String? value) {
//         setState(() {
//           isSelectedValue = value!;
//         });
//       },
//     );
//   }
// }

// class profile extends HookConsumerWidget {
//   const profile({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final size = MediaQuery.of(context).size;
//     final authPageStateController =
//         ref.watch(authSwitcherPriovider.notifier); //変更　関数の実行
//     final authController = ref.watch(authControllerProvider.notifier);
//     final userState = ref.watch(userControllerProvider);
//     final userController = ref.watch(userControllerProvider.notifier);

//     return Scaffold(
//       backgroundColor: HexColor("#615C5C"),
//       body: SafeArea(
//         child: Builder(
//           builder: ((context) => SingleChildScrollView(
//                   child: SizedBox(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Container(
//                         width: double.infinity,
//                         height: 40,
//                         padding: const EdgeInsets.symmetric(horizontal: 10),
//                         margin: const EdgeInsets.only(bottom: 5),
//                         decoration: const BoxDecoration(
//                             color: Color.fromARGB(0, 62, 60, 60)),
//                         child: Row(
//                           children: [
//                             SizedBox(
//                               width: 20,
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 Navigator.pop(
//                                   context,
//                                 );
//                               },
//                               child: Text(
//                                 '戻る',
//                                 style: TextStyle(
//                                     fontSize: 20, color: Colors.white),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Column(
//                         children: [
//                           Container(
//                             height: 130,
//                             child: Stack(
//                               children: [
//                                 Container(
//                                   height: 130,
//                                   width: double.infinity,
//                                   decoration: const BoxDecoration(
//                                     image: DecorationImage(
//                                       image: NetworkImage(
//                                           "https://images.prod.hjholdings.tv/d3urerHm/uploads/e38a15bc-26ab-41cb-98c5-a9f0edd65aab.png?w=1600&h=600&p=t"),
//                                     ),
//                                   ),
//                                 ),
//                                 Align(
//                                   alignment: Alignment(-0.8, 0.8),
//                                   child: Container(
//                                     width: 90,
//                                     height: 90,
//                                     decoration: BoxDecoration(
//                                         borderRadius:
//                                             BorderRadius.circular(100),
//                                         image: DecorationImage(
//                                           image: NetworkImage(
//                                               "https://pbs.twimg.com/profile_images/1476930792404426755/TKHWR94S_400x400.jpg"),
//                                         )),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Container(
//                             height: 40,
//                             width: double.infinity,
//                             decoration: const BoxDecoration(
//                               color: Color.fromARGB(255, 0, 0, 0),
//                             ),
//                             alignment: Alignment(-0.5, 0.8),
//                             child: Text(
//                               userState?.name ?? "ななし",
//                               style:
//                                   TextStyle(fontSize: 30, color: Colors.white),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Column(
//                             children: [
//                               Container(
//                                 alignment: Alignment(-0.8, 0.8),
//                                 child: Text("自己紹介",
//                                     style: TextStyle(
//                                         color: Color.fromARGB(
//                                             255, 255, 255, 255))),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Container(
//                             width: 330,
//                             height: 200,
//                             padding: const EdgeInsets.symmetric(horizontal: 30),
//                             margin: const EdgeInsets.only(bottom: 15),
//                             decoration: BoxDecoration(
//                                 color: const Color.fromARGB(255, 62, 60, 60),
//                                 borderRadius: const BorderRadius.all(
//                                     Radius.circular(30))),
//                             child: TextFormField(
//                               keyboardType: TextInputType.multiline,
//                               maxLines: 20,
//                               maxLength: 200,
//                               style: const TextStyle(
//                                   fontSize: 24,
//                                   color: Colors.white,
//                                   height: 1.2),
//                               decoration: InputDecoration(
//                                   hintStyle: const TextStyle(
//                                       color:
//                                           Color.fromARGB(255, 255, 255, 255)),
//                                   border: InputBorder.none,
//                                   focusedBorder: InputBorder.none),
//                             ),
//                           ),
//                           Column(
//                             children: [
//                               Container(
//                                 alignment: Alignment(-0.8, 0.8),
//                                 child: Text("ステータス",
//                                     style: TextStyle(
//                                         color: Color.fromARGB(
//                                             255, 255, 255, 255))),
//                               ),
//                             ],
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(20.0),
//                             child: Center(
//                               child: DropdownButtonMenu(),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ))),
//         ),
//       ),
//     );
//   }
// }
