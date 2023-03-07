// ignore_for_file: non_constant_identifier_names, avoid_print, sized_box_for_whitespace, unnecessary_null_comparison

import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jci/Home/Aboutapp.dart';
import 'package:jci/Home/Events/Events.dart';
import 'package:jci/Home/Lom%20Axctivitey/LOMDetailes.dart';
import 'package:jci/main.dart';
import 'package:jci/splaysh.dart';
import 'package:jci/units/Storage.dart';
import 'package:launch_review/launch_review.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../units/api.dart';
import 'Dowloads.dart';
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

List<dynamic> area = [];
List<dynamic> adsimage = [];
List<dynamic> membership = [];
List<dynamic> finance = [];
List<dynamic> po = [];
List<dynamic> substaff = [];

bool Loom1 = true;
bool Loom2 = true;
// ignore: unused_element
bool _isImageVisible = false;
String backimage =
    "https://t4.ftcdn.net/jpg/01/06/92/47/360_F_106924759_7qPPu6bZNN2O4al1ExdEWBdHUcpKMwuJ.jpg";

class Home extends StatefulWidget {
  final String? youtybeURL;
  const Home(this.youtybeURL, {super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late YoutubePlayerController _controller;
  final CarouselController carouselController = CarouselController();
  int currentindex = 0;

  @override
  void initState() {
    getInfo();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(channel.id, channel.name,
                    color: Color(Appbarcolour.hashCode),
                    playSound: true,
                    icon: "@mipmap/ic_launcher")));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title!),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body!)],
                  ),
                ),
              );
            });
      }
    });

    Adsapi();
    _showImage();
    // Timer(const Duration(seconds: 20), () => _checkLastImageDisplayTime());

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

  void getInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String packageName = packageInfo.version;
    setState(() {});

    if (packageName != getdata.read('varsion')) {
      _showMyDialogg();
    }
  }

  Future<void> _showMyDialogg() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'JCI Zone VIII New version 0.0.${getdata.read('varsion')} is available',
            style: GoogleFonts.poppins(),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  setState(() {});
                  Get.back();
                },
                child: Text(
                  'Later',
                  style: GoogleFonts.poppins(color: Colors.black),
                )),
            TextButton(
                onPressed: () {
                  setState(() {
                    LaunchReview.launch(androidAppId: "com.jciindiazone8.app");
                    Get.back();
                  });
                },
                child: const Text(
                  'Update Now',
                  style: TextStyle(color: Colors.blue, fontFamily: "popins"),
                )),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
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
                  Get.to(() => const Aboutinfo(),
                      transition: Transition.leftToRight);
                } else if (menu == "Share") {
                  Share.share(
                      'https://play.google.com/store/apps/details?id=com.jciindiazone8.app');
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
          snackBar: const SnackBar(content: Text("Tap back again to Exit.")),
          child: SingleChildScrollView(
            child: Column(
              children: [
                widget.youtybeURL != null
                    ? Container(
                        height: Get.height / 3.5,
                        child: YoutubePlayerControllerProvider(
                          controller: _controller,
                          child: YoutubePlayerIFrame(controller: _controller),
                        ),
                      )
                    : const SizedBox(),
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
                                Get.to(() => const Zonedirectory(),
                                    transition: Transition.leftToRight);
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
                              onTap: () {
                                Get.to(() => InAppbrowser(),
                                    transition: Transition.leftToRight);
                              },
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
        if (kDebugMode) {}

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
        setState(() {});
        pastprlist.clear();

        val.forEach((e) {
          pastprlist.add(e);
        });
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
        setState(() {});
        pastnational.clear();

        val.forEach((e) {
          pastnational.add(e);
        });
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
        setState(() {});
        trainers.clear();

        val.forEach((e) {
          trainers.add(e);
        });
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
        setState(() {});
        eventlist.clear();

        val.forEach((e) {
          eventlist.add(e);
        });
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
        setState(() {});
        lomactlist.clear();

        val.forEach((e) {
          lomactlist.add(e);
        });
      } else {
        setState(() {});
        lomactlist.clear();
        ApiWrapper.showToastMessage("Something Went Wrong!!");
      }
    });
  }

  HeadAPI() async {
    ApiWrapper.dataGet(AppUrl.Headquaters).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        val['finance'].forEach((e) {
          finance.add(e);
        });
      } else {
        setState(() {});
        ApiWrapper.showToastMessage("Something Went Wrong!!");
      }
    });
  }

  HeadAPI1() async {
    ApiWrapper.dataGet(AppUrl.Headquaters).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        val['membership'].forEach((e) {
          membership.add(e);
        });
      } else {
        setState(() {});
        ApiWrapper.showToastMessage("Something Went Wrong!!");
      }
    });
  }

  HeadAPI2() async {
    ApiWrapper.dataGet(AppUrl.Headquaters).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
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
        val['area_wise'].forEach((e) {
          area.add(e);
        });
      } else {
        setState(() {});
        ApiWrapper.showToastMessage("Something Went Wrong!!");
      }
    });
  }

  HeadAPI4() async {
    ApiWrapper.dataGet(AppUrl.Headquaters).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        val['substaff'].forEach((e) {
          substaff.add(e);
        });
      } else {
        setState(() {});
        ApiWrapper.showToastMessage("Something Went Wrong!!");
      }
    });
  }

  _wahtt() async {
    String num = getdata.read('Downloads').toString();

    var url = Uri.parse("$num");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  HeadAPI5() async {
    ApiWrapper.dataGet(AppUrl.Headquaters).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        val['po'].forEach((e) {
          po.add(e);
        });
      } else {
        setState(() {});
        ApiWrapper.showToastMessage("Something Went Wrong!!");
      }
    });
  }

  Adsapi() async {
    ApiWrapper.dataGet(AppUrl.Ads).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        val.forEach((e) {
          adsimage.add(e);
        });
        setState(() {});
      } else {
        setState(() {});
        ApiWrapper.showToastMessage("Something Went Wrong!!");
      }
    });
  }

  void _navigateToHomePage() {
    Get.to(() => const Homepage());
  }

  Future<void> _showImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    DateTime lastDisplayDate = prefs.getString('last_display_date') != null
        ? DateTime.parse(prefs.getString('last_display_date')!)
        : DateTime(0);

    DateTime today = DateTime.now();

    if (lastDisplayDate.day != today.day) {
      Timer(const Duration(seconds: 10), () {
        setState(() {
          _navigateToHomePage();
        });
        Timer(const Duration(seconds: 10), () {
          setState(() {
            _isImageVisible = false;
          });
          prefs.setString('last_display_date', today.toString());
        });
      });
    }
  }

  void shownotification() {
    setState(() {});
    flutterLocalNotificationsPlugin.show(
        0,
        "Testing",
        "How are you",
        NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                importance: Importance.high,
                color: Colors.pink,
                playSound: true,
                icon: "@mipmap/ic_launcher")));
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
                    style: const TextStyle(
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
                    icon: const Icon(
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
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        timeLeft--;
      });

      if (timeLeft == 0) {
        timer.cancel();
      }
    });
  }
}
