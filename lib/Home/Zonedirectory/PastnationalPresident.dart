// ignore_for_file: file_names

import '../../../splaysh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../units/Storage.dart';
import '../home.dart';
import 'Details.dart';

class PastnationalPresident extends StatefulWidget {
  const PastnationalPresident({Key? key}) : super(key: key);

  @override
  State<PastnationalPresident> createState() => _PastnationalPresidentState();
}

class _PastnationalPresidentState extends State<PastnationalPresident> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Past National President',
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: Color(Appbarcolour.hashCode),
      ),
      body: ListView.builder(
        // controller: controller,
        itemCount: pastnational.length,
        itemBuilder: (_, index) {
          return Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Get.width / 20, vertical: 10),
            child: InkWell(
              onTap: () {
                setState(() {
                  save('ZGB', pastnational[index]);
                  Get.to(() => const Detailes());
                });
              },
              child: Container(
                // height: Get.height / 4,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Color(Appbarcolour.hashCode)),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Get.height / 100, horizontal: Get.width / 30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Color(Appbarcolour.hashCode),
                            backgroundImage:
                                pastnational[index]['image'] != null
                                    ? NetworkImage(
                                        pastnational[index]['image'].toString(),
                                      )
                                    : NetworkImage(backimage),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: Get.width / 1.8,
                                child: Text(
                                  pastnational[index]['name'].toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(fontSize: 16),
                                ),
                              ),
                              pastnational[index]['post'] == null ||
                                      pastnational[index]['post'] == ""
                                  ? const SizedBox()
                                  : SizedBox(
                                      width: Get.width / 1.8,
                                      child: Text(
                                        pastnational[index]['post'].toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            GoogleFonts.poppins(fontSize: 16),
                                      ),
                                    ),
                            ],
                          ),
                          const Spacer(),
                          Icon(
                            Icons.navigate_next_outlined,
                            color: Color(Appbarcolour.hashCode),
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
