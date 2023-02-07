// ignore_for_file: prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../splaysh.dart';
import '../../../units/Storage.dart';

class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);
  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: Get.width / 1.5,
                          child: Text(
                            getdata.read('secretory')['name'] ?? "",
                            overflow: TextOverflow.clip,
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        getdata.read('secretory')['alloted_zone'] == null ||
                                getdata.read('secretory')['alloted_zone'] == ""
                            ? const SizedBox()
                            : SizedBox(
                                width: Get.width / 1.5,
                                child: Text(
                                  "Alloted-zone ${getdata.read('secretory')['alloted_zone']}",
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
                    getdata.read('secretory')['role'] == null ||
                            getdata.read('secretory')['role'] == ""
                        ? const SizedBox()
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                  getdata.read('secretory')['role'] ?? "",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                    getdata.read('secretory')['phone'] == null ||
                            getdata.read('secretory')['phone'] == null
                        ? const SizedBox()
                        : const SizedBox(
                            height: 5,
                          ),
                    getdata.read('secretory')['phone'] == null ||
                            getdata.read('secretory')['phone'] == null
                        ? const SizedBox()
                        : InkWell(
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
                                    getdata.read('secretory')['phone'] ?? "",
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              _makingPhoneCall();
                            },
                          ),
                    getdata.read('secretory')['email'] == null ||
                            getdata.read('secretory')['email'] == ""
                        ? const SizedBox()
                        : const SizedBox(
                            height: 5,
                          ),
                    getdata.read('secretory')['email'] == null ||
                            getdata.read('secretory')['email'] == ""
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
                                    getdata.read('secretory')['email'] ?? "",
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
                    getdata.read('secretory')['email2'] == null ||
                            getdata.read('secretory')['email2'] == ""
                        ? const SizedBox()
                        : const SizedBox(
                            height: 5,
                          ),
                    getdata.read('secretory')['email2'] == null ||
                            getdata.read('secretory')['email2'] == ""
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
                                    getdata.read('secretory')['email2'] ?? "",
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              emaiollaunch2();
                            },
                          ),
                    getdata.read('secretory')['phone'] == null ||
                            getdata.read('secretory')['phone'] == ""
                        ? const SizedBox()
                        : const SizedBox(
                            height: 5,
                          ),
                    getdata.read('secretory')['phone'] == null ||
                            getdata.read('secretory')['phone'] == null
                        ? const SizedBox()
                        : InkWell(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                    getdata.read('secretory')['phone'] ?? "",
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              _wahtt();
                            },
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
    String num = getdata.read('secretory')['phone'].toString();
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
    String number = getdata.read('secretory')['phone'].toString();

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
    String email = getdata.read('secretory')['email'].toString();
    // ignore: deprecated_member_use
    launch('mailto:$email');
  }

  emaiollaunch2() async {
    String email = getdata.read('secretory')['email2'].toString();
    // ignore: deprecated_member_use
    launch('mailto:$email');
  }
}
