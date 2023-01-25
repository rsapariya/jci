import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jci/colour.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'ZoneDirectory.dart';

class Home extends StatefulWidget {
  final String? youtybeURL;
  const Home(this.youtybeURL);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId:
            YoutubePlayerController.convertUrlToId(widget.youtybeURL!)!,
        params: YoutubePlayerParams(
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
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined))
        ],
        title: Text(
          'JCI India Zone VIII',
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Column(
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
          SizedBox(
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
                        image: AssetImage('assets/images/directory.png'))),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: containe(
                        text: "Events",
                        image: AssetImage('assets/images/done.png'))),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
            child: Row(
              children: [
                Expanded(
                    child: containe(
                        text: "Lom Activities",
                        image: AssetImage('assets/images/pin.png'))),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: containe(
                        text: "Downloads",
                        image: AssetImage('assets/images/download.png'))),
              ],
            ),
          ),
        ],
      ),
    );
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
            SizedBox(
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
}
