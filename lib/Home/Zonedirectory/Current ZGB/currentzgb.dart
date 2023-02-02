import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jci/Home/Zonedirectory/Current%20ZGB/Details.dart';
import 'package:jci/Home/home.dart';

import '../../../splaysh.dart';
import '../../../units/Storage.dart';
import '../../../units/colour.dart';
import '../Details.dart';

class CurrentZGB extends StatefulWidget {
  const CurrentZGB({Key? key}) : super(key: key);

  @override
  State<CurrentZGB> createState() => _CurrentZGBState();
}

class _CurrentZGBState extends State<CurrentZGB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Current ZGB',
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: Color(Appbarcolour.hashCode)!!,
      ),
      body: ListView.builder(
        itemCount: currentzgb.length,
        itemBuilder: (_, index) {
          return Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Get.width / 20, vertical: 10),
            child: InkWell(
              onTap: () {
                setState(() {
                  save('ZGB', currentzgb[index]);
                  Get.to(() => currentDetails());
                });
              },
              child: Container(
                // height: Get.height / 4,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Color(Appbarcolour.hashCode)!!!),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Get.height / 100, horizontal: Get.width / 30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Color(Appbarcolour.hashCode)!.withOpacity(0.7),
                            backgroundImage: currentzgb[index]['image'] != null
                                ? NetworkImage(
                                    currentzgb[index]['image'].toString(),
                                  )
                                : NetworkImage(backimage),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: Get.width / 1.8,
                                child: Text(
                                  currentzgb[index]['name'].toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(fontSize: 16),
                                ),
                              ),
                              SizedBox(
                                width: Get.width / 1.8,
                                child: Text(
                                  currentzgb[index]['post'].toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(
                            Icons.navigate_next_outlined,
                            color: Color(Appbarcolour.hashCode)!!,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Future<void> _showMyDialogg() async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text(
  //           getdata.read('ZGB')[0].toString(),
  //           style: GoogleFonts.poppins(),
  //         ),
  //         actions: [
  //           TextButton(
  //               onPressed: () {
  //                 setState(() {});
  //                 Get.back();
  //               },
  //               child: Text(
  //                 getdata.read('ZGB')["Name"].toString(),
  //                 style: GoogleFonts.poppins(),
  //               )),
  //           TextButton(
  //               onPressed: () {
  //                 setState(() {
  //                   Get.back();
  //                 });
  //               },
  //               child: const Text(
  //                 'Delete',
  //                 style: TextStyle(color: Colors.red, fontFamily: "popins"),
  //               )),
  //         ],
  //       );
  //     },
  //   );
  // }
}
