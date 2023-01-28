import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jci/Home/Zonedirectory/Lom.dart';
import 'package:jci/Home/Zonedirectory/Past%20Zone%20President.dart';
import 'package:jci/Home/Zonedirectory/PastnationalPresident.dart';

import '../../units/colour.dart';
import 'Current ZGB/currentzgb.dart';
import 'National Headquaters/Nationalheadquaters.dart';
import 'Trainers/Nationaltrainers.dart';

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
                  Get.to(() => const CurrentZGB());
                },
                text: "CURRENT ZGB"),
            container(
                onTap: () {
                  Get.to(() => const Nationalheadquaters());
                },
                text: "NATIONAL HEADQUARTERS"),
            container(
                onTap: () {
                  Get.to(() => const PastPresident());
                },
                text: "PAST ZONE PRESIDENT"),
            container(
                onTap: () {
                  Get.to(() => const PastnationalPresident());
                },
                text: "PAST NATIONAL PRESIDENT"),
            container(
                onTap: () {
                  Get.to(() => const Nationaltrainers());
                },
                text: "NATIONAL TRAINERS"),
            container(
                onTap: () {
                  Get.to(() => Lomlist());
                },
                text: "LOM"),
            container(icon: Icons.download, text: "Download Directory PDF"),
          ],
        ),
      ),
    );
  }

  container({void Function()? onTap, required String text, IconData? icon}) {
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
                  const Spacer(),
                  Icon(
                    icon,
                    color: Appbarcolour,
                  ),
                  SizedBox(
                    width: Get.width / 30,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}