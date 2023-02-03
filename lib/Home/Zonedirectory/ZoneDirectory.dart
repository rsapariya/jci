import 'dart:io';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jci/Home/Zonedirectory/Lom.dart';
import 'package:jci/Home/Zonedirectory/Past%20Zone%20President.dart';
import 'package:jci/Home/Zonedirectory/PastnationalPresident.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../splaysh.dart';
import 'Current ZGB/currentzgb.dart';
import 'National Headquaters/Nationalheadquaters.dart';
import 'Trainers/Nationaltrainers.dart';
import 'download.dart';

class Zonedirectory extends StatefulWidget {
  const Zonedirectory({Key? key}) : super(key: key);

  @override
  State<Zonedirectory> createState() => _ZonedirectoryState();
}

class _ZonedirectoryState extends State<Zonedirectory> {
  // Future<void> download2(Dio dio, String url, String savePath) async {
  //   Response response = await dio.get(url,
  //       onReceiveProgress: showDownloadPregress,
  //       options: Options(
  //           responseType: ResponseType.bytes,
  //           followRedirects: false,
  //           validateStatus: (status) {
  //             return status! < 500;
  //           }));
  //
  //   File file = File(savePath);
  //   var raf = file.openSync(
  //     mode: FileMode.write,
  //   );
  //
  //   raf.writeFromSync(response.data);
  //   await raf.close();
  // }

  var dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(Appbarcolour.hashCode)!,
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
              SizedBox(
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
                  text: "NATIONAL TRAINERS"),
              container(
                  onTap: () {
                    Get.to(
                      () => Lomlist(),
                      transition: Transition.leftToRight,
                    );
                  },
                  text: "LOM"),
              container(
                  icon: Icons.download,
                  text: "Download Directory PDF",
                  onTap: () async {
                    setState(() {});
                  }),
            ],
          ),
        ),
      ),
    );
  }
  //
  // void showDownloadPregress(received, totel) {
  //   if (totel != -1) {
  //     print((received / totel * 100).toStringAsFixed(0) + "%");
  //   }
  // }

  // Future<String> getFilePath() async {
  //   final dir = await getApplicationDocumentsDirectory();
  //   return "${dir.path}";
  // }

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
                color: Color(Appbarcolour.hashCode)!,
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
                    color: Color(Appbarcolour.hashCode)!,
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

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> openFile({required String url, String? fileName}) async {
    print('---------------');
    final file = await downloadFile(url, fileName!);
    print('---------------');
    if (file == null) return;
    print("path: ${file.path}");
    OpenFilex.open(file.path);
  }

  Future<File?> downloadFile(String url, String name) async {
    try {
      print("111111111");

      final appStorage = await getApplicationDocumentsDirectory();
      final file = File('${appStorage.path}/$name');
      print("22222222");
      setState(() {});
      final responce = await Dio().get(url,
          options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: 0,
          ));
      print("333333333");
      final raf = file.openSync(mode: FileMode.write);
      print("44444444");
      raf.writeByteSync(responce.data);
      print("55555");
      await raf.close();
      print("66666666");
      return file;
    } catch (e) {
      return null;
    }
  }
}
