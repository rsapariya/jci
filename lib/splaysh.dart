// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jci/units/api.dart';
import 'Home/home.dart';

String? im1;
String? im2;
Color? Appbarcolour;
String bgColor = "#03fc39";
List sliderimage = [];
String? url;
String? pdfurl;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

final firebaseInstance = FirebaseFirestore.instance;

class _SplashScreenState extends State<SplashScreen> {
  Future<void> getDocs() async {
    try {
      var response = await firebaseInstance
          .collection('dynamic')
          .doc('Ja8uyFAnOzkVCTUOpbCA')
          .get();
      print(response['them'].toString());
      setState(() {});
      bgColor = response['them'];
      Appbarcolour = Color(int.parse(bgColor.replaceAll("#", "Oxff")));
      im1 = response['image1'];
      im2 = response['imag2'];
      pdfurl = response['pdf'];
      print('===========================================================');
      print(bgColor);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    youtubeapi();
    SLiderapi();
    super.initState();
    getDocs();
    print('===========================================================');
    Timer(
      const Duration(seconds: 4),
      () => Get.offAll(
        () => Home(url),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/splay.png',
                scale: 3,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "JCI India Zone VIII",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
              ),
            ],
          ),
        ));
  }

  youtubeapi() {
    ApiWrapper.dataGet(AppUrl.Youtube).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        setState(() {});
        url = val['url'];
        print("UUUURRRLLL");
        print(url.toString());
      } else {
        setState(() {});
        currentzgb.clear();
        ApiWrapper.showToastMessage("Something Went Wrong!!");
      }
    });
  }

  SLiderapi() {
    ApiWrapper.dataGet(AppUrl.slider).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        setState(() {});
        val.forEach((e) {
          sliderimage.add(e);
          print("Slider_______>>>>>$e");
        });
      } else {
        setState(() {});
        // sliderimage.clear();
        ApiWrapper.showToastMessage("Something Went Wrong!!");
      }
    });
  }
}
