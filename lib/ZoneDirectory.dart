import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jci/colour.dart';

import 'Nationalheadquaters.dart';
import 'currentzgb.dart';

class Zonedirectory extends StatefulWidget {
  const Zonedirectory({Key? key}) : super(key: key);

  @override
  State<Zonedirectory> createState() => _ZonedirectoryState();
}

class _ZonedirectoryState extends State<Zonedirectory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appbarcolour,
        title: Text(
          "Zone Directory",
          style: GoogleFonts.poppins(),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width / 30, vertical: Get.height / 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/splay.png',
                  scale: 4,
                ),
                Image.asset(
                  'assets/images/splay.png',
                  scale: 4,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            container(
                onTap: () {
                  Get.to(() =>const CurrentZGB());
                },
                text: "CURRENT ZGB"),
            container(
                onTap: () {
                  Get.to(() =>const Nationalheadquaters());
                },
                text: "NATIONAL HEADQUARTERS"),
            container(onTap: () {}, text: "PAST ZONE PRESIDENT"),
            container(onTap: () {}, text: "PAST NATIONAL PRESIDENT"),
            container(onTap: () {}, text: "NATIONAL TRAINERS"),
            container(onTap: () {}, text: "LOM"),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(left: Get.width / 30),
                child: Row(
                  children: [
                    Text(
                      "Download Directory PDF",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Appbarcolour,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  container({void Function()? onTap, required String text}) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.only(bottom: Get.height / 80),
        child: Container(
          height: Get.height / 15,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Appbarcolour,
                width: 1,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: Get.width / 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
