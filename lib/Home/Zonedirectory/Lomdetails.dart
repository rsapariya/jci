// ignore_for_file: deprecated_member_use, non_constant_identifier_names, prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jci/Home/Zonedirectory/Lom.dart';
import 'package:jci/Home/Zonedirectory/lomtabs.dart';
import 'package:jci/Home/home.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../splaysh.dart';
import '../../units/Storage.dart';
import '../../units/api.dart';

class Lomdetails extends StatefulWidget {
  const Lomdetails({Key? key}) : super(key: key);

  @override
  State<Lomdetails> createState() => _LomdetailsState();
}

class _LomdetailsState extends State<Lomdetails> {
  @override
  // bool Loding = true;
  void initState() {
    // LomdetailApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !Loom
          ? ListView.builder(
              // controller: controller,
              itemCount: lomlistdetails.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width / 30, vertical: 10),
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
                              Stack(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    backgroundImage: NetworkImage(backimage),
                                    radius: 30,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: lomlistdetails[index]
                                                    ['image'] ==
                                                null ||
                                            lomlistdetails[index]['image'] == ""
                                        ? NetworkImage(backimage)
                                        : NetworkImage(
                                            lomlistdetails[index]['image']),
                                    radius: 30,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: Get.width / 1.5,
                                    child: Text(
                                      lomlistdetails[index]['name'] ?? "",
                                      overflow: TextOverflow.clip,
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  lomlistdetails[index]['post'] == null ||
                                          lomlistdetails[index]['post'] == ""
                                      ? const SizedBox()
                                      : SizedBox(
                                          width: Get.width / 1.5,
                                          child: Text(
                                            lomlistdetails[index]['post'] ?? "",
                                            overflow: TextOverflow.ellipsis,
                                            // maxLines: 2,
                                            style: GoogleFonts.poppins(
                                                color: Colors.white),
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
                            // border:Border.all(color:Color(Appbarcolour.hashCode)!!,width: 1.5),
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
                              lomlistdetails[index]['LOM'] == null ||
                                      lomlistdetails[index]['LOM'] == ""
                                  ? const SizedBox()
                                  : Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            lomlistdetails[index]['LOM'] ?? "",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                              lomlistdetails[index]['contact_no'] == "" ||
                                      lomlistdetails[index]['contact_no'] ==
                                          null
                                  ? const SizedBox()
                                  : const SizedBox(
                                      height: 5,
                                    ),
                              lomlistdetails[index]['contact_no'] == null ||
                                      lomlistdetails[index]['contact_no'] ==
                                          null
                                  ? const SizedBox()
                                  : InkWell(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                              lomlistdetails[index]
                                                      ['contact_no'] ??
                                                  "",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        setState(() {
                                          save(
                                              "call",
                                              lomlistdetails[index]
                                                  ['contact_no']);
                                          _makingPhoneCall();
                                        });
                                      },
                                    ),
                              lomlistdetails[index]['contact_no'] == "" ||
                                      lomlistdetails[index]['contact_no'] ==
                                          null
                                  ? const SizedBox()
                                  : const SizedBox(
                                      height: 5,
                                    ),
                              lomlistdetails[index]['email'] == null ||
                                      lomlistdetails[index]['email'] == ""
                                  ? const SizedBox()
                                  : InkWell(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                              lomlistdetails[index]['email'] ??
                                                  "",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        setState(() {
                                          save('LOM',
                                              lomlistdetails[index]['email']);
                                        });
                                        emaiollaunch();
                                      },
                                    ),
                              lomlistdetails[index]['office_address'] == "" ||
                                      lomlistdetails[index]['office_address'] ==
                                          null
                                  ? const SizedBox()
                                  : Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: Color(Appbarcolour.hashCode),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        SizedBox(
                                          width: Get.width / 1.3,
                                          child: Text(
                                            lomlistdetails[index]
                                                ['office_address'],
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                              lomlistdetails[index]['contact_no'] == "" ||
                                      lomlistdetails[index]['contact_no'] ==
                                          null
                                  ? const SizedBox()
                                  : const SizedBox(
                                      height: 5,
                                    ),
                              lomlistdetails[index]['contact_no'] == "" ||
                                      lomlistdetails[index]['contact_no'] ==
                                          null
                                  ? const SizedBox()
                                  : InkWell(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                              "Whatsapp Contact",
                                              // lomlistdetails[index]['contact_no'] ??
                                              //     "",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        setState(() {
                                          save(
                                              "call",
                                              lomlistdetails[index]
                                                  ['contact_no']);
                                          _wahtt();
                                        });
                                      },
                                    )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.transparent,
                color: Color(Appbarcolour.hashCode),
                value: null,
                strokeWidth: 3.0,
              ),
            ),
    );
  }

  LomdetailApi() {
    ApiWrapper.dataGet(AppUrl.Lomdetail + lomid.toString()).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        setState(() {});
        lomlistdetails.clear();
        val.forEach((e) {
          lomlistdetails.add(e);
        });
        lomlistdetails.sort((a, b) =>
            (int.parse(a['priority'])).compareTo(int.parse(b['priority'])));
        // Loding = false;
      } else {
        setState(() {});
        // Loding = false;
        lomlistdetails.clear();
        ApiWrapper.showToastMessage("Something Went Wrong!!");
      }
    });
  }

  _makingPhoneCall() async {
    String num = getdata.read('call').toString();
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
    String number = getdata.read('call').toString();

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
    String email = getdata.read('LOM').toString();
    launch('mailto:$email');
  }
}
