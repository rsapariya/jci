import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/parser.dart';
import 'package:jci/Home/Aboutapp.dart';
import 'package:jci/Home/Events/Events.dart';
import 'package:jci/Home/Lom%20Axctivitey/LOMDetailes.dart';
import 'package:jci/splaysh.dart';
import 'package:jci/units/Storage.dart';
import 'package:launch_review/launch_review.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../units/api.dart';
import 'package:html/parser.dart' show parse;

import 'Zonedirectory/ZoneDirectory.dart';

List currentzgb = [];
List lomactlist = [];
List lomlist = [];
List lomlistdetails = [];
List Memberlist = [];
List eventlist = [];
List pastnational = [];
List pastprlist = [];
List trainers = [];
List Mdeta = [];
var cc;

List<dynamic> area = [];
List<dynamic> adsimage = [];
List<dynamic> membership = [];
List<dynamic> finance = [];
List<dynamic> po = [];
List<dynamic> substaff = [];
var Adspic;

String backimage =
    "https://t4.ftcdn.net/jpg/01/06/92/47/360_F_106924759_7qPPu6bZNN2O4al1ExdEWBdHUcpKMwuJ.jpg";

class Home extends StatefulWidget {
  final String? youtybeURL;
  const Home(this.youtybeURL);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late YoutubePlayerController _controller;
  final CarouselController carouselController = CarouselController();
  int currentindex = 0;
  @override
  void initState() {
    Adsapi();
    Timer(Duration(seconds: 20), () => _checkLastImageDisplayTime());

    Admob.requestTrackingAuthorization();
    NationalTrainerAPI();
    HeadAPI();
    HeadAPI1();
    HeadAPI2();
    HeadAPI3();
    HeadAPI4();
    HeadAPI5();
    currentapi();
    ActiAPI();
    LomAPI();
    EventApi();
    Pastnationalapi();
    Pastprapi();
    _controller = YoutubePlayerController(
      initialVideoId:
          YoutubePlayerController.convertUrlToId(widget.youtybeURL!)!,
      params: const YoutubePlayerParams(
        loop: true,
        autoPlay: true,
        desktopMode: false,
        mute: true,
        strictRelatedVideos: true,
        showFullscreenButton: !kIsWeb,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // backgroundColor:Color(int.parse(bgColor.replaceAll('#', '0xff'))),
          backgroundColor: Color(Appbarcolour.hashCode),
          actions: [
            PopupMenuButton(
              padding: EdgeInsets.zero,
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: "Share",
                  child: Text(
                    'Share',
                    style: GoogleFonts.poppins(),
                  ),
                ),
                PopupMenuItem(
                  value: "App info",
                  child: Text('App info', style: GoogleFonts.poppins()),
                ),
                PopupMenuItem(
                  value: "Rate Us",
                  child: Text('Rate Us', style: GoogleFonts.poppins()),
                ),
              ],
              onSelected: (String menu) {
                if (menu == "App info") {
                  Get.to(() => Aboutinfo(), transition: Transition.leftToRight);
                } else if (menu == "Share") {
                  Share.share(
                      'https://play.google.com/store/apps/details?id=com.jciindia.directory');
                } else if (menu == "Rate Us") {
                  LaunchReview.launch(androidAppId: "com.jciindiazone8.app");
                }
              },
            )
          ],
          title: Text(
            'JCI India Zone VIII',
            style: GoogleFonts.poppins(),
          ),
        ),
        body: DoubleBackToCloseApp(
          snackBar: SnackBar(content: Text("Tap back again to Exit.")),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: Get.height / 3.5,
                  child: YoutubePlayerControllerProvider(
                    controller: _controller,
                    child: YoutubePlayerIFrame(
                      controller: _controller,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                  child: Row(
                    children: [
                      Expanded(
                          child: containe(
                              onTap: () {
                                _checkLastImageDisplayTime();
                                // Get.to(() => Zonedirectory(),
                                //     transition: Transition.leftToRight);
                              },
                              text: "Zone Directory",
                              image: const AssetImage(
                                  'assets/images/directory.png'))),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          child: containe(
                              onTap: () {
                                Get.to(() => const Event(),
                                    transition: Transition.leftToRight);
                              },
                              text: "Events",
                              image:
                                  const AssetImage('assets/images/done.png'))),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                  child: Row(
                    children: [
                      Expanded(
                          child: containe(
                              onTap: () {
                                Get.to(() => const LomDeteils(),
                                    transition: Transition.leftToRight);
                              },
                              text: "Lom Activities",
                              image:
                                  const AssetImage('assets/images/pin.png'))),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          child: containe(
                              text: "Downloads",
                              image: const AssetImage(
                                  'assets/images/download.png'))),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Get.height / 60),
                  child: CarouselSlider(
                      items: sliderimage
                          .map((item) => Image.network(
                                item['image'],
                                fit: BoxFit.fill,
                                width: double.infinity,
                              ))
                          .toList(),
                      carouselController: carouselController,
                      options: CarouselOptions(
                          scrollPhysics: const BouncingScrollPhysics(),
                          autoPlay: true,
                          aspectRatio: 2,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentindex = index;
                            });
                          })),
                )
              ],
            ),
          ),
        ));
  }

  containe(
      {required String text,
      required ImageProvider<Object> image,
      void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: Get.height / 5.5,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(Appbarcolour.hashCode), width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2), //New
                blurRadius: 25.0,
              )
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: Get.width / 5,
              height: Get.height / 12,
              child: Image(
                image: image,
                // fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(text,
                style: GoogleFonts.poppins(
                    color: Colors.black, fontWeight: FontWeight.w400))
          ],
        ),
      ),
    );
  }

  currentapi() {
    ApiWrapper.dataGet(AppUrl.Current).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        setState(() {});
        print("----------currentapi---------------");

        currentzgb.clear();
        val.forEach((e) {
          currentzgb.add(e);
        });
      } else {
        setState(() {});
        currentzgb.clear();
        ApiWrapper.showToastMessage("Something Went Wrong!!");
      }
    });
  }

  Pastprapi() {
    ApiWrapper.dataGet(AppUrl.PasrPR).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        print("----------Pastprapi---------------");

        setState(() {});
        pastprlist.clear();

        val.forEach((e) {
          pastprlist.add(e);
          print("----------Pastprapi---------------$e");
        });
        // pastprlist.sort((a, b) => (int.parse(a['priority'])).compareTo(int.parse(b['priority'])));
        // print(e);
      } else {
        setState(() {});
        pastprlist.clear();
        ApiWrapper.showToastMessage("Something Went Wrong!!");
      }
    });
  }

  Pastnationalapi() {
    ApiWrapper.dataGet(AppUrl.PasrNational).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        print("----------Pastnationalapi---------------");

        setState(() {});
        pastnational.clear();

        val.forEach((e) {
          pastnational.add(e);
        });
        // print(e);
      } else {
        setState(() {});
        pastnational.clear();
        ApiWrapper.showToastMessage("Something Went Wrong!!");
      }
    });
  }

  NationalTrainerAPI() {
    ApiWrapper.dataGet(AppUrl.Trainers).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        print("----------NationalTrainerAPI---------------");

        setState(() {});
        trainers.clear();

        val.forEach((e) {
          trainers.add(e);
        });
        // print(e);
      } else {
        setState(() {});
        trainers.clear();
        ApiWrapper.showToastMessage("Something Went Wrong!!");
      }
    });
  }

  LomAPI() {
    ApiWrapper.dataGet(AppUrl.Lom).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        print("----------LomAPI---------------");

        setState(() {});
        lomlist.clear();

        val.forEach((e) {
          lomlist.add(e);
        });
      } else {
        setState(() {});
        lomlist.clear();
        ApiWrapper.showToastMessage("Something Went Wrong!!");
      }
    });
  }

  EventApi() {
    ApiWrapper.dataGet(AppUrl.Events).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        print("----------EventApi---------------");

        setState(() {});
        eventlist.clear();

        val.forEach((e) {
          eventlist.add(e);
        });
        // print(e);
      } else {
        setState(() {});
        eventlist.clear();
        ApiWrapper.showToastMessage("Something Went Wrong!!");
      }
    });
  }

  ActiAPI() {
    ApiWrapper.dataGet(AppUrl.Lomactivity).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        print("----------ActiAPI---------------");

        setState(() {});
        lomactlist.clear();

        val.forEach((e) {
          lomactlist.add(e);
        });
        // print(e);
      } else {
        print("----------vvvvvvvvvv---------------");
        setState(() {});
        lomactlist.clear();
        ApiWrapper.showToastMessage("Something Went Wrong!!");
      }
    });
  }

  HeadAPI() async {
    ApiWrapper.dataGet(AppUrl.Headquaters).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        print("----------HeadAPI---------------");

        val['finance'].forEach((e) {
          finance.add(e);
        });
      } else {
        print("----------vvvvvvvvvv---------------");
        setState(() {});
        ApiWrapper.showToastMessage("Something Went Wrong!!");
      }
    });
  }

  HeadAPI1() async {
    ApiWrapper.dataGet(AppUrl.Headquaters).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        print("----------HeadAPI1---------------");

        val['membership'].forEach((e) {
          membership.add(e);
        });
      } else {
        print("----------vvvvvvvvvv---------------");
        setState(() {});
        ApiWrapper.showToastMessage("Something Went Wrong!!");
      }
    });
  }

  HeadAPI2() async {
    ApiWrapper.dataGet(AppUrl.Headquaters).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        print("----------HeadAPI2---------------");

        save('secretory', val['secretary']);
        setState(() {});
      } else {
        setState(() {});
        ApiWrapper.showToastMessage("Something Went Wrong!!");
      }
    });
  }

  HeadAPI3() async {
    ApiWrapper.dataGet(AppUrl.Headquaters).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        print("----------HeadAPI3---------------");

        val['area_wise'].forEach((e) {
          area.add(e);
        });
      } else {
        print("----------vvvvvvvvvv---------------");
        setState(() {});
        ApiWrapper.showToastMessage("Something Went Wrong!!");
      }
    });
  }

  HeadAPI4() async {
    ApiWrapper.dataGet(AppUrl.Headquaters).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        print("----------HeadAPI4---------------");

        val['substaff'].forEach((e) {
          substaff.add(e);
        });
      } else {
        print("----------vvvvvvvvvv---------------");
        setState(() {});
        ApiWrapper.showToastMessage("Something Went Wrong!!");
      }
    });
  }

  HeadAPI5() async {
    ApiWrapper.dataGet(AppUrl.Headquaters).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        val['po'].forEach((e) {
          print("----------HeadAPI5---------------");
          po.add(e);
        });
      } else {
        // print("----------vvvvvvvvvv---------------");
        setState(() {});
        ApiWrapper.showToastMessage("Something Went Wrong!!");
      }
    });
  }

  Adsapi() async {
    ApiWrapper.dataGet(AppUrl.Ads).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        val.forEach((e) {
          print("----------IMAGE   ---------------");
          adsimage.add(e);
        });
        setState(() {});
      } else {
        setState(() {});
        ApiWrapper.showToastMessage("Something Went Wrong!!");
      }
    });
  }

  void _checkLastImageDisplayTime() async {
    print("TT_________________________________________________________TT");

    final prefs = await SharedPreferences.getInstance();
    setState(() {});
    final lastImageDisplayTime = prefs.getInt('last_image_display_time');
    print("TT_________________________________________________________TT");

    print(lastImageDisplayTime);

    final currentTime = DateTime.now().millisecondsSinceEpoch;
    print(currentTime);
    final difference = currentTime - lastImageDisplayTime!;
    print(difference);
    print("TT_________________________________________________________TT");
    if (difference == null || difference >= Duration(days: 1).inMilliseconds) {
      prefs.setInt('last_image_display_time', currentTime);
      Timer(Duration(seconds: 10), () => _navigateToHomePage());
      return;
    }
  }

  void _navigateToHomePage() {
    Get.to(() => Homepage());
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Center(child: Image.network(adsimage[0]['image'])),
            if (timeLeft > 0)
              Positioned(
                  left: Get.width / 1.14,
                  top: Get.height / 20,
                  child: Text(
                    '$timeLeft',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            if (timeLeft == 0)
              Positioned(
                  left: Get.width / 1.14,
                  top: Get.height / 20,
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {});
                      Navigator.of(context).pop();
                      // Get.off(()=>Home());
                    },
                  )),
          ],
        ));
  }

  Timer? timer;
  int timeLeft = 10;
  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  void _startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        timeLeft--;
      });

      if (timeLeft == 0) {
        timer.cancel();
      }
    });
  }
}
