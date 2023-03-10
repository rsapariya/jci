import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jci/Home/Zonedirectory/Lom.dart';
import 'package:jci/Home/Zonedirectory/Past%20Zone%20President.dart';
import 'package:jci/Home/Zonedirectory/PastnationalPresident.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

import '../../../splaysh.dart';
import 'Current ZGB/currentzgb.dart';
import 'National Headquaters/Nationalheadquaters.dart';
import 'Trainers/Nationaltrainers.dart';

class Zonedirectory extends StatefulWidget {
  const Zonedirectory({Key? key}) : super(key: key);

  @override
  State<Zonedirectory> createState() => _ZonedirectoryState();
}

class _ZonedirectoryState extends State<Zonedirectory> {
  var dio = Dio();
  double? progress;
  bool pdfee = false;
  // static Dio dio = Dio();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(Appbarcolour.hashCode),
        title: Text(
          "Zone Directory",
          style: GoogleFonts.poppins(),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width / 30, vertical: Get.height / 40),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.white,
                    height: Get.height / 4,
                    width: Get.width / 2.15,
                    child: Image.network(
                      im1.toString(),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: Get.height / 4,
                    width: Get.width / 2.15,
                    child: Image.network(
                      im2.toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              container(
                  onTap: () {
                    Get.to(
                      () => const CurrentZGB(),
                      transition: Transition.leftToRight,
                    );
                  },
                  text: "CURRENT ZGB"),
              container(
                  onTap: () {
                    Get.to(() => const Nationalheadquaters(),
                        transition: Transition.leftToRight);
                  },
                  text: "NATIONAL HEADQUARTERS"),
              container(
                  onTap: () {
                    Get.to(
                      () => const PastPresident(),
                      transition: Transition.leftToRight,
                    );
                  },
                  text: "PAST ZONE PRESIDENT"),
              container(
                  onTap: () {
                    Get.to(
                      () => const PastnationalPresident(),
                      transition: Transition.leftToRight,
                    );
                  },
                  text: "PAST NATIONAL PRESIDENT"),
              container(
                  onTap: () {
                    Get.to(
                      () => const Nationaltrainers(),
                      transition: Transition.leftToRight,
                    );
                  },
                  text: "NATIONAL/ZONE TRAINERS"),
              container(
                  onTap: () {
                    Get.to(
                      () => const Lomlist(),
                      transition: Transition.leftToRight,
                    );
                  },
                  text: "LOM"),
              container(
                  icon: Icons.download,
                  child: CircularProgressIndicator(
                    color: Color(Appbarcolour.hashCode),
                  ),
                  text: "Download Directory PDF",
                  onTap: () async {
                    setState(() {
                      pdfee = true;
                    });
                    downloadAndOpenFile(pdfurl!, "ZoneDirectory.pdf")
                        .then((value) {})
                        .catchError((error) {});
                  }),
            ],
          ),
        ),
      ),
    );
  }

  container(
      {void Function()? onTap,
      required String text,
      IconData? icon,
      icon2,
      Widget? child}) {
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
                color: Color(Appbarcolour.hashCode),
                width: 1,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
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
                  pdfee == false
                      ? Icon(
                          icon,
                          color: Color(Appbarcolour.hashCode),
                        )
                      : SizedBox(
                          child: child,
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

  Future<void> downloadAndOpenFile(String url, String fileName) async {
    Dio dio = Dio();
    var directory = await getTemporaryDirectory();
    var filePath = '${directory.path}/$fileName';

    try {
      await dio.download(url, filePath);
      OpenFilex.open(filePath);
      setState(() {
        pdfee = false;
      });
    } catch (e) {}
  }
}
