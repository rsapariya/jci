import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jci/Home/Events/Events.dart';
import 'package:jci/Home/Lom%20Axctivitey/LOMDetailes.dart';
import 'package:jci/splaysh.dart';
import 'package:jci/units/Storage.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../units/api.dart';
import '../units/colour.dart';
import 'Zonedirectory/ZoneDirectory.dart';

List currentzgb = [];
List lomactlist = [];
List lomlist = [];
List lomlistdetails = [];
List eventlist = [];
List pastnational = [];
List pastprlist = [];
List trainers = [];

List<dynamic> area = [];
List<dynamic> membership = [];
List<dynamic> finance = [];
List<dynamic> po = [];
List<dynamic> substaff = [];

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
            showFullscreenButton: !kIsWeb));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Appbarcolour,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.more_vert_outlined))
          ],
          title: Text(
            'JCI India Zone VIII',
            style: GoogleFonts.poppins(),
          ),
        ),
        body: SingleChildScrollView(
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
                              Get.to(() => const Zonedirectory());
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
                              Get.to(() => const Event());
                            },
                            text: "Events",
                            image: const AssetImage('assets/images/done.png'))),
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
                              Get.to(() => const LomDeteils());
                            },
                            text: "Lom Activities",
                            image: const AssetImage('assets/images/pin.png'))),
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
            border: Border.all(color: Appbarcolour, width: 2),
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
        // print(e);
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
}
