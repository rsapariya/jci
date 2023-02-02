import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jci/Home/home.dart';
import '../../../units/Storage.dart';
import '../../../units/colour.dart';
import '../Details.dart';
import 'headetails.dart';
import '../../../splaysh.dart';
class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        // controller: controller,
        itemCount: area.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.only(
                left: Get.width / 30, right: Get.width / 30, top: 10),
            child: InkWell(
              onTap: () {
                setState(() {
                  save('ZGB', area[index]);
                  Get.to(() => HeadDetailes());
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Color(Appbarcolour.hashCode.hashCode.hashCode.hashCode)!),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Get.height / 100, horizontal: Get.width / 30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: Get.width / 1.5,
                                child: Text(
                                  area[index]['name'].toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(fontSize: 16),
                                ),
                              ),
                              // SizedBox(
                              //   width: Get.width / 1.5,
                              //   child: Text(
                              //     "${area[index]['role']}",
                              //     overflow: TextOverflow.ellipsis,
                              //     style: GoogleFonts.poppins(fontSize: 16),
                              //   ),
                              // ),
                            ],
                          ),
                          Spacer(),
                          Icon(
                            Icons.navigate_next_outlined,
                            color: Color(Appbarcolour.hashCode.hashCode.hashCode.hashCode)!,
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
}
