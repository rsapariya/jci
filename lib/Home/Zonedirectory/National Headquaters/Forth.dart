import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jci/Home/home.dart';

import '../../../splaysh.dart';
import '../../../units/Storage.dart';
import 'headetails.dart';

class Forth extends StatefulWidget {
  const Forth({Key? key}) : super(key: key);

  @override
  State<Forth> createState() => _ForthState();
}

class _ForthState extends State<Forth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        // controller: controller,
        itemCount: finance.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.only(
                left: Get.width / 30, right: Get.width / 30, top: 10),
            child: InkWell(
              onTap: () {
                setState(() {
                  save('ZGB', finance[index]);
                  Get.to(() => const HeadDetailes(),
                      transition: Transition.rightToLeft);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        width: 1, color: Color(Appbarcolour.hashCode)),
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
                                  finance[index]['name'].toString()??"",
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(fontSize: 16),
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
