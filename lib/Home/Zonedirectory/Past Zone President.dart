
// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../splaysh.dart';
import '../../../units/Storage.dart';
import '../home.dart';
import 'Details.dart';

class PastPresident extends StatefulWidget {
  const PastPresident({Key? key}) : super(key: key);

  @override
  State<PastPresident> createState() => _PastPresidentState();
}

class _PastPresidentState extends State<PastPresident> {
  List dailog = [];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Past Zone President',
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: Color(Appbarcolour.hashCode),
      ),
      body: ListView.builder(
        // controller: controller,
        itemCount: pastprlist.length,
        itemBuilder: (_, index) {
          return Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Get.width / 20, vertical: 10),
            child: InkWell(
              onTap: () {
                setState(() {
                  save('ZGB', pastprlist[index]);
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
                            backgroundImage: pastprlist[index]['image'] != null
                                ? NetworkImage(
                                    pastprlist[index]['image'].toString(),
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
                                  pastprlist[index]['name'].toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(fontSize: 16),
                                ),
                              ),
                              pastprlist[index]['post'] != null
                                  ? SizedBox(
                                      width: Get.width / 1.8,
                                      child: Text(
                                        pastprlist[index]['post'].toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            GoogleFonts.poppins(fontSize: 16),
                                      ),
                                    )
                                  : const SizedBox(),
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
