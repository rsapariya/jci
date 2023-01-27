// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:jci/Home/Lom%20Axctivitey/LOMDetailes.dart';
// import 'package:jci/Home/home.dart';
//
// import '../../../units/colour.dart';
// import '../../units/Storage.dart';
//
// class LomActivity extends StatefulWidget {
//   const LomActivity({Key? key}) : super(key: key);
//
//   @override
//   State<LomActivity> createState() => _LomActivityState();
// }
//
// class _LomActivityState extends State<LomActivity> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'LOM Activites',
//           style: GoogleFonts.poppins(),
//         ),
//         backgroundColor: Appbarcolour,
//       ),
//       body: ListView.builder(
//         // controller: controller,
//         itemCount: lomactlist.length,
//         itemBuilder: (_, index) {
//           return Padding(
//             padding:
//                 EdgeInsets.symmetric(horizontal: Get.width / 20, vertical: 10),
//             child: InkWell(
//               onTap: () {
//                 setState(() {
//                   save('LOM', lomactlist[index]);
//                   Get.to(() => LomDeteils());
//                 });
//               },
//               child: Container(
//                 // height: Get.height / 4,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(width: 1, color: Appbarcolour),
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                       vertical: Get.height / 100, horizontal: Get.width / 30),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Stack(
//                             children: [
//                               CircleAvatar(
//                                 // backgroundColor: Appbarcolour.withOpacity(0.7),
//                                 backgroundImage: NetworkImage(backimage),
//                                 // radius: 30,
//                               ),
//                               CircleAvatar(
//                                 backgroundColor: Colors.transparent,
//                                 backgroundImage:
//                                 getdata.read('LOM')['featured_img'] == null ||
//                                     getdata.read('LOM')['featured_img'] == ""
//                                     ? NetworkImage(backimage)
//                                     : NetworkImage(
//                                     getdata.read('LOM')['featured_img']),
//                                 // radius: 30,
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Column(
//                             children: [
//                               SizedBox(
//                                 width: Get.width / 1.7,
//                                 child: Text(
//                                   lomactlist[index]['project_name'].toString(),
//                                   overflow: TextOverflow.ellipsis,
//                                   style: GoogleFonts.poppins(fontSize: 16),
//                                 ),
//                               ),
//                               // SizedBox(
//                               //   width: Get.width / 2,
//                               //   child: Text(
//                               //     lomactlist[index]['event'].toString(),
//                               //     maxLines: 2,
//                               //     overflow: TextOverflow.ellipsis,
//                               //     style: GoogleFonts.poppins(fontSize: 14),
//                               //   ),
//                               // ),
//                             ],
//                           ),
//                           Spacer(),
//                           Icon(
//                             Icons.navigate_next_outlined,
//                             color: Appbarcolour,
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
// // Future<void> _showMyDialogg() async {
// //   return showDialog<void>(
// //     context: context,
// //     barrierDismissible: false, // user must tap button!
// //     builder: (BuildContext context) {
// //       return AlertDialog(
// //         title: Text(
// //           getdata.read('ZGB')[0].toString(),
// //           style: GoogleFonts.poppins(),
// //         ),
// //         actions: [
// //           TextButton(
// //               onPressed: () {
// //                 setState(() {});
// //                 Get.back();
// //               },
// //               child: Text(
// //                 getdata.read('ZGB')["Name"].toString(),
// //                 style: GoogleFonts.poppins(),
// //               )),
// //           TextButton(
// //               onPressed: () {
// //                 setState(() {
// //                   Get.back();
// //                 });
// //               },
// //               child: const Text(
// //                 'Delete',
// //                 style: TextStyle(color: Colors.red, fontFamily: "popins"),
// //               )),
// //         ],
// //       );
// //     },
// //   );
// // }
// }
