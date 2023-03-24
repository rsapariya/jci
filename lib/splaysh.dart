// ignore_for_file: non_constant_identifier_names, empty_catches
import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jci/units/Storage.dart';
import 'package:jci/units/api.dart';
import 'Home/home.dart';

bool hasInternetConnection = false;
bool isconnection = false;
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
      setState(() {});
      save('varsion', response['version']);
      bgColor = response['them'];
      Appbarcolour = Color(int.parse(bgColor.replaceAll("#", "Oxff")));
      save('c', Appbarcolour);
      im1 = response['image1'];
      im2 = response['imag2'];
      save('Downloads', response['downloads']);
      pdfurl = response['pdf'];
    } catch (e) {}
  }

  colora() {
    Appbarcolour = getdata.read('c');
  }

  late StreamSubscription subscription;
  @override
  void initState() {
    checkInternetConnection();

    youtubeapi();
    SLiderapi();
    super.initState();
    getDocs();
    colora();
    Timer(
      const Duration(seconds: 4),
      () => Get.offAll(() => Home(),
          transition: Transition.fade),
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
                'assets/images/VIII_Logo_2023_clipdrop-enhance.jpg',
                scale: 7,
              ),
              const SizedBox(
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
        save('YOU', val['url'].toString());
        setState(() {});
        print("+++++++++++++++>>>>>>>>>..${getdata.read('YOU')}");
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
        print(
            '---------------------------------------------------------ccccccccccccccccccccccccccccccc');
        print(val);
        val.forEach((e) {
          sliderimage.add(e);
        });
      } else {
        setState(() {});
        // sliderimage.clear();
        ApiWrapper.showToastMessage("Something Went Wrong!!");
      }
    });
  }

  Future<bool> checkInternetConnection() async {
    print("------      1111111      ------");
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          isconnection = true;
        });
      }
    } on SocketException catch (_) {
      setState(() {
        isconnection = false;
      });
      ApiWrapper.showToastMessage('Please turn on the Internet');
    }
    return false;
  }
}
