// ignore_for_file: prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jci/Home/home.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../splaysh.dart';
import '../../../units/Storage.dart';

class TrainersDetails extends StatefulWidget {
  const TrainersDetails({Key? key}) : super(key: key);

  @override
  State<TrainersDetails> createState() => _TrainersDetailsState();
}

class _TrainersDetailsState extends State<TrainersDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(Appbarcolour.hashCode),
        title: Text(
          'Details',
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width / 30, vertical: 10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5), //New
                        blurRadius: 3,
                        spreadRadius: 2)
                  ],
                  color: Color(Appbarcolour.hashCode),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5))),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width / 30, vertical: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: getdata.read('TR')['image'] != null
                          ? NetworkImage(getdata.read('TR')['image'].toString())
                          : NetworkImage(backimage),
                      radius: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: Get.width / 1.5,
                          child: Text(
                            getdata.read('TR')['name'] ?? "",
                            overflow: TextOverflow.clip,
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        getdata.read('TR')['post'] == null ||
                                getdata.read('TR')['post'] == ""
                            ? const SizedBox()
                            : SizedBox(
                                width: Get.width / 1.5,
                                child: Text(
                                  getdata.read('TR')['post'] ?? "",
                                  overflow: TextOverflow.ellipsis,
                                  // maxLines: 2,
                                  style:
                                      GoogleFonts.poppins(color: Colors.white),
                                ),
                              ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.4), //New
                        blurRadius: 3,
                        spreadRadius: 2)
                  ],
                  // border:Border.all(color:Color(Appbarcolour.hashCode)!,width: 1.5),
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5))),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width / 30, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getdata.read('TR')['lom'] == null ||
                            getdata.read('TR')['lom'] == ""
                        ? const SizedBox()
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.home_filled,
                                color: Color(Appbarcolour.hashCode),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: Get.width / 1.5,
                                child: Text(
                                  getdata.read('TR')['lom'] ?? "",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                    const SizedBox(
                      height: 5,
                    ),
                    getdata.read('TR')['phone'] == null ||
                            getdata.read('TR')['phone'] == null
                        ? const SizedBox()
                        : InkWell(
                            onTap: () {
                              _makingPhoneCall();
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.call,
                                  color: Color(Appbarcolour.hashCode),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: Get.width / 1.5,
                                  child: Text(
                                    getdata.read('TR')['phone'] ?? "",
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),const SizedBox(
                      height: 5,
                    ),
                    getdata.read('TR')['phone'] == null ||
                            getdata.read('TR')['phone'] == null
                        ? const SizedBox()
                        : InkWell(
                            onTap: () {
                              _wahtt();
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.whatsapp,
                                  color: Color(Appbarcolour.hashCode),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: Get.width / 1.5,
                                  child: Text(
                                    getdata.read('TR')['phone'] ?? "",
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                    const SizedBox(
                      height: 5,
                    ),
                    getdata.read('TR')['email'] == null ||
                            getdata.read('TR')['email'] == ""
                        ? const SizedBox()
                        : InkWell(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.email,
                                  color: Color(Appbarcolour.hashCode),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: Get.width / 1.5,
                                  child: Text(
                                    getdata.read('TR')['email'] ?? "",
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              emaiollaunch();
                            },
                          ),
                    const SizedBox(
                      height: 5,
                    ),
                    getdata.read('TR')['address'] == "" ||
                            getdata.read('TR')['address'] == null
                        ? const SizedBox()
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Color(Appbarcolour.hashCode),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: Get.width / 1.5,
                                child: Text(
                                  getdata.read('TR')['address'],
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _makingPhoneCall() async {
    String num = getdata.read('TR')['phone'].toString();
    if (num.toString().length == 10) {
      var url = Uri.parse("tel:+91$num");
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    } else {
      var url = Uri.parse("tel:$num");
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  _wahtt() async {
    String number = getdata.read('TR')['phone'].toString();

    final Uri uri = number.toString().length == 10
        ? Uri.parse("whatsapp://send?phone=" + "91" + number)
        : Uri.parse("whatsapp://send?phone=$number");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw "ERROR ";
    }
  }

  emaiollaunch() async {
    String email = getdata.read('TR')['email'].toString();
    // ignore: deprecated_member_use
    launch('mailto:$email');
  }
}
