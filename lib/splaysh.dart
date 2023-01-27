// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jci/units/api.dart';
import 'Home/home.dart';

List sliderimage = [];
String? url;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    youtubeapi();
    SLiderapi();
    super.initState();
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
