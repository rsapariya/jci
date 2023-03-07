// ignore_for_file: non_constant_identifier_names, camel_case_types, annotate_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jci/Home/home.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../splaysh.dart';
import '../../units/Storage.dart';

bool Loomd = true;

class memberdetai extends StatefulWidget {
  const memberdetai({Key? key}) : super(key: key);

  @override
  State<memberdetai> createState() => _memberdetaiState();
}

class _memberdetaiState extends State<memberdetai> {
  @override
  void initState() {
    Mdeta.clear();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appbarcolour,
        title: const Text("Details"),
        centerTitle: true,
      ),
      body:
          Padding(
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
                                backgroundImage: getdata.read(
                                                'Mdeta')['profile_image'] ==
                                            null ||
                                        getdata.read(
                                                'Mdeta')['profile_image'] ==
                                            ""
                                    ? NetworkImage(backimage)
                                    : NetworkImage(
                                        "https://jciindiazone8.in/portal/${getdata.read('Mdeta')['profile_image']}"),
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
                                  getdata.read('Mdeta')['name'] ?? "",
                                  overflow: TextOverflow.clip,
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              getdata.read('Mdeta')['business_category'] ==
                                          null ||
                                      getdata.read(
                                              'Mdeta')['business_category'] ==
                                          ""
                                  ? const SizedBox()
                                  : SizedBox(
                                      width: Get.width / 1.5,
                                      child: Text(
                                        getdata.read(
                                                'Mdeta')['business_category'] ??
                                            "",
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
                          getdata.read('Mdeta')['occupation'] == null ||
                                  getdata.read('Mdeta')['occupation'] == ""
                              ? const SizedBox()
                              : Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.business_center_outlined,
                                      color: Color(Appbarcolour.hashCode),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: Get.width / 1.3,
                                      child: Text(
                                        getdata.read('Mdeta')['occupation'] ??
                                            "",
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                          getdata.read('Mdeta')['is_private'] == "1"
                              ? const SizedBox()
                              : getdata.read('Mdeta')['contact_no'] == null ||
                                      getdata.read('Mdeta')['contact_no'] ==
                                          null
                                  ? const SizedBox()
                                  : const SizedBox(
                                      height: 10,
                                    ),
                          getdata.read('Mdeta')['is_private'] == "1"
                              ? const SizedBox()
                              : getdata.read('Mdeta')['contact_no'] == null ||
                                      getdata.read('Mdeta')['contact_no'] ==
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
                                            width: Get.width / 1.3,
                                            child: Text(
                                              getdata.read(
                                                      'Mdeta')['contact_no'] ??
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
                                              getdata
                                                  .read('Mdeta')['contact_no']);
                                          _makingPhoneCall();
                                        });
                                      },
                                    ),
                          getdata.read('Mdeta')['email'] == null ||
                                  getdata.read('Mdeta')['email'] == ""
                              ? const SizedBox()
                              : const SizedBox(
                                  height: 10,
                                ),
                          getdata.read('Mdeta')['email'] == null ||
                                  getdata.read('Mdeta')['email'] == ""
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
                                          getdata.read('Mdeta')['email'] ?? "",
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
                                          getdata.read('Mdeta')['email']);
                                    });
                                    emaiollaunch();
                                  },
                                ),
                          getdata.read('Mdeta')['office_email'] == null ||
                                  getdata.read('Mdeta')['office_email'] == ""
                              ? const SizedBox()
                              : const SizedBox(
                                  height: 10,
                                ),
                          getdata.read('Mdeta')['office_email'] == null ||
                                  getdata.read('Mdeta')['office_email'] == ""
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
                                          getdata.read(
                                                  'Mdeta')['office_email'] ??
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
                                          'LOM',
                                          getdata
                                              .read('Mdeta')['office_email']);
                                    });
                                    emaiollaunch();
                                  },
                                ),
                          getdata.read('Mdeta')['is_private'] == "1"
                              ? const SizedBox()
                              : getdata.read('Mdeta')['home_address'] == "" ||
                                      getdata.read('Mdeta')['home_address'] ==
                                          null
                                  ? const SizedBox()
                                  : const SizedBox(
                                      height: 10,
                                    ),
                          getdata.read('Mdeta')['is_private'] == "1"
                              ? const SizedBox()
                              : getdata.read('Mdeta')['home_address'] == "" ||
                                      getdata.read('Mdeta')['home_address'] ==
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
                                            getdata
                                                .read('Mdeta')['home_address'],
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                          getdata.read('Mdeta')['office_address'] == "" ||
                                  getdata.read('Mdeta')['office_address'] ==
                                      null
                              ? const SizedBox()
                              : const SizedBox(
                                  height: 10,
                                ),
                          getdata.read('Mdeta')['office_address'] == "" ||
                                  getdata.read('Mdeta')['office_address'] ==
                                      null
                              ? const SizedBox()
                              : Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.add_business,
                                      color: Color(Appbarcolour.hashCode),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: Get.width / 1.3,
                                      child: Text(
                                        getdata.read('Mdeta')['office_address'],
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                          getdata.read('Mdeta')['is_private'] == "1"
                              ? const SizedBox()
                              : getdata.read('Mdeta')['contact_no'] == "" ||
                                      getdata.read('Mdeta')['contact_no'] ==
                                          null
                                  ? const SizedBox()
                                  : const SizedBox(
                                      height: 10,
                                    ),
                          getdata.read('Mdeta')['is_private'] == "1"
                              ? const SizedBox()
                              : getdata.read('Mdeta')['contact_no'] == "" ||
                                      getdata.read('Mdeta')['contact_no'] ==
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
                                              getdata
                                                  .read('Mdeta')['contact_no'],
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
                                              getdata
                                                  .read('Mdeta')['contact_no']);
                                          _wahtt();
                                        });
                                      },
                                    ),
                          getdata.read('Mdeta')['business_name'] == "" ||
                                  getdata.read('Mdeta')['business_name'] == null
                              ? const SizedBox()
                              : const SizedBox(
                                  height: 10,
                                ),
                          getdata.read('Mdeta')['business_name'] == "" ||
                                  getdata.read('Mdeta')['business_name'] == null
                              ? const SizedBox()
                              : InkWell(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.category_outlined,
                                        color: Color(Appbarcolour.hashCode),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        width: Get.width / 1.5,
                                        child: Text(
                                          getdata.read(
                                                  'Mdeta')['business_name'] ??
                                              "",
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
                                ),
                          getdata.read('Mdeta')['is_private'] == "1"
                              ? const SizedBox()
                              : getdata.read('Mdeta')['birthdate'] == "" &&
                                      getdata.read('Mdeta')['birthdate'] ==
                                          null &&
                                      getdata.read('Mdeta')['anniversary'] ==
                                          "" &&
                                      getdata.read('Mdeta')['anniversary'] ==
                                          null &&
                                      getdata.read('Mdeta')['joining_year'] ==
                                          "" &&
                                      getdata.read('Mdeta')['joining_year'] ==
                                          null
                                  ? const SizedBox()
                                  : const SizedBox(
                                      height: 10,
                                    ),
                          getdata.read('Mdeta')['is_private'] == "1"
                              ? const SizedBox()
                              : getdata.read('Mdeta')['birthdate'] == "" &&
                                      getdata.read('Mdeta')['birthdate'] ==
                                          null &&
                                      getdata.read('Mdeta')['anniversary'] ==
                                          "" &&
                                      getdata.read('Mdeta')['anniversary'] ==
                                          null &&
                                      getdata.read('Mdeta')['joining_year'] ==
                                          "" &&
                                      getdata.read('Mdeta')['joining_year'] ==
                                          null
                                  ? const SizedBox()
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        getdata.read('Mdeta')['birthdate'] ==
                                                    "" ||
                                                getdata.read(
                                                        'Mdeta')['birthdate'] ==
                                                    null ||
                                                getdata.read(
                                                        'Mdeta')['birthdate'] ==
                                                    "0000-00-00"
                                            ? const SizedBox()
                                            : Column(
                                                children: [
                                                  SizedBox(
                                                    width: Get.width / 3.8,
                                                    child: Text(
                                                      "Birthdate",
                                                      style: GoogleFonts.poppins(
                                                          color: Color(
                                                              Appbarcolour
                                                                  .hashCode),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: Get.width / 3.8,
                                                    child: Text(
                                                      getdata.read('Mdeta')[
                                                              'birthdate'] ??
                                                          "",
                                                      // lomlistdetails[index]['contact_no'] ??
                                                      //     "",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ),
                                                  )
                                                ],
                                              ),
                                        getdata.read('Mdeta')['anniversary'] ==
                                                    "" ||
                                                getdata.read('Mdeta')[
                                                        'anniversary'] ==
                                                    "0000-00-00" ||
                                                getdata.read('Mdeta')[
                                                        'anniversary'] ==
                                                    null
                                            ? const SizedBox()
                                            : Column(
                                                children: [
                                                  SizedBox(
                                                    width: Get.width / 3.8,
                                                    child: Text(
                                                      "Anniversary",
                                                      style: GoogleFonts.poppins(
                                                          color: Color(
                                                              Appbarcolour
                                                                  .hashCode),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: Get.width / 3.8,
                                                    child: Text(
                                                      getdata.read('Mdeta')[
                                                              'anniversary'] ??
                                                          "",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ),
                                                  )
                                                ],
                                              ),
                                        getdata.read('Mdeta')['joining_year'] ==
                                                    "" ||
                                                getdata.read('Mdeta')[
                                                        'joining_year'] ==
                                                    null
                                            ? const SizedBox()
                                            : Column(
                                                children: [
                                                  SizedBox(
                                                    width: Get.width / 3.8,
                                                    child: Text(
                                                      "Joining year",
                                                      style: GoogleFonts.poppins(
                                                          color: Color(
                                                              Appbarcolour
                                                                  .hashCode),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: Get.width / 3.8,
                                                    child: Text(
                                                      getdata.read('Mdeta')[
                                                              'joining_year'] ??
                                                          "",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ),
                                                  )
                                                ],
                                              ),
                                      ],
                                    )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
    );
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
        ? Uri.parse("whatsapp://send?phone=91$number")
        : Uri.parse("whatsapp://send?phone=$number");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw "ERROR ";
    }
  }

  emaiollaunch() async {
    String email = getdata.read('LOM').toString();
    // ignore: deprecated_member_use
    launch('mailto:$email');
  }
}
