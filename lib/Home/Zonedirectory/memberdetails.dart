// ignore_for_file: non_constant_identifier_names, camel_case_types, annotate_overrides

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

bool Loomd = true;

class memberdetai extends StatefulWidget {
  const memberdetai({Key? key}) : super(key: key);

  @override
  State<memberdetai> createState() => _memberdetaiState();
}

class _memberdetaiState extends State<memberdetai> {
  @override
  void initState() {
    Memdetaapi();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appbarcolour,
        title: const Text("Details"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.off(() => const lomtabes());
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: !Loomd
          ? Padding(
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
                                backgroundImage: Mdeta[0]['profile_image'] ==
                                            null ||
                                        Mdeta[0]['profile_image'] == ""
                                    ? NetworkImage(backimage)
                                    : NetworkImage(
                                        "https://jciindiazone8.in/portal/${Mdeta[0]['profile_image']}"),
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
                                  Mdeta[0]['name'] ?? "",
                                  overflow: TextOverflow.clip,
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Mdeta[0]['business_category'] == null ||
                                      Mdeta[0]['business_category'] == ""
                                  ? const SizedBox()
                                  : SizedBox(
                                      width: Get.width / 1.5,
                                      child: Text(
                                        Mdeta[0]['business_category'] ?? "",
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
                          Mdeta[0]['occupation'] == null ||
                                  Mdeta[0]['occupation'] == ""
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
                                        Mdeta[0]['occupation'] ?? "",
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                          Mdeta[0]['is_private'] == "1"
                              ? const SizedBox()
                              : Mdeta[0]['contact_no'] == null ||
                                      Mdeta[0]['contact_no'] == null
                                  ? const SizedBox()
                                  : const SizedBox(
                                      height: 10,
                                    ),
                          Mdeta[0]['is_private'] == "1"
                              ? const SizedBox()
                              : Mdeta[0]['contact_no'] == null ||
                                      Mdeta[0]['contact_no'] == null
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
                                              Mdeta[0]['contact_no'] ?? "",
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
                                          save("call", Mdeta[0]['contact_no']);
                                          _makingPhoneCall();
                                        });
                                      },
                                    ),
                          Mdeta[0]['email'] == null || Mdeta[0]['email'] == ""
                              ? const SizedBox()
                              : const SizedBox(
                                  height: 10,
                                ),
                          Mdeta[0]['email'] == null || Mdeta[0]['email'] == ""
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
                                          Mdeta[0]['email'] ?? "",
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
                                      save('LOM', Mdeta[0]['email']);
                                    });
                                    emaiollaunch();
                                  },
                                ),
                          Mdeta[0]['office_email'] == null ||
                                  Mdeta[0]['office_email'] == ""
                              ? const SizedBox()
                              : const SizedBox(
                                  height: 10,
                                ),
                          Mdeta[0]['office_email'] == null ||
                                  Mdeta[0]['office_email'] == ""
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
                                          Mdeta[0]['office_email'] ?? "",
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
                                      save('LOM', Mdeta[0]['office_email']);
                                    });
                                    emaiollaunch();
                                  },
                                ),
                          Mdeta[0]['is_private'] == "1"
                              ? const SizedBox()
                              : Mdeta[0]['home_address'] == "" ||
                                      Mdeta[0]['home_address'] == null
                                  ? const SizedBox()
                                  : const SizedBox(
                                      height: 10,
                                    ),
                          Mdeta[0]['is_private'] == "1"
                              ? const SizedBox()
                              : Mdeta[0]['home_address'] == "" ||
                                      Mdeta[0]['home_address'] == null
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
                                            Mdeta[0]['home_address'],
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                          Mdeta[0]['office_address'] == "" ||
                                  Mdeta[0]['office_address'] == null
                              ? const SizedBox()
                              : const SizedBox(
                                  height: 10,
                                ),
                          Mdeta[0]['office_address'] == "" ||
                                  Mdeta[0]['office_address'] == null
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
                                        Mdeta[0]['office_address'],
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                          Mdeta[0]['is_private'] == "1"
                              ? const SizedBox()
                              : Mdeta[0]['contact_no'] == "" ||
                                      Mdeta[0]['contact_no'] == null
                                  ? const SizedBox()
                                  : const SizedBox(
                                      height: 10,
                                    ),
                          Mdeta[0]['is_private'] == "1"
                              ? const SizedBox()
                              : Mdeta[0]['contact_no'] == "" ||
                                      Mdeta[0]['contact_no'] == null
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
                                          save("call", Mdeta[0]['contact_no']);
                                          _wahtt();
                                        });
                                      },
                                    ),
                          Mdeta[0]['business_name'] == "" ||
                                  Mdeta[0]['business_name'] == null
                              ? const SizedBox()
                              : const SizedBox(
                                  height: 10,
                                ),
                          Mdeta[0]['business_name'] == "" ||
                                  Mdeta[0]['business_name'] == null
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
                                          Mdeta[0]['business_name'] ?? "",
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
                          Mdeta[0]['is_private'] == "1"
                              ? const SizedBox()
                              : Mdeta[0]['birthdate'] == "" &&
                                      Mdeta[0]['birthdate'] == null &&
                                      Mdeta[0]['anniversary'] == "" &&
                                      Mdeta[0]['anniversary'] == null &&
                                      Mdeta[0]['joining_year'] == "" &&
                                      Mdeta[0]['joining_year'] == null
                                  ? const SizedBox()
                                  : const SizedBox(
                                      height: 10,
                                    ),
                          Mdeta[0]['is_private'] == "1"
                              ? const SizedBox()
                              : Mdeta[0]['birthdate'] == "" &&
                                      Mdeta[0]['birthdate'] == null &&
                                      Mdeta[0]['anniversary'] == "" &&
                                      Mdeta[0]['anniversary'] == null &&
                                      Mdeta[0]['joining_year'] == "" &&
                                      Mdeta[0]['joining_year'] == null
                                  ? const SizedBox()
                                  : Row(
                                      children: [
                                        Mdeta[0]['birthdate'] == "" ||
                                                Mdeta[0]['birthdate'] == null ||
                                                Mdeta[0]['birthdate'] ==
                                                    "0000-00-00"
                                            ? const SizedBox()
                                            : Column(
                                                children: [
                                                  SizedBox(
                                                    width: Get.width / 3.8,
                                                    child: Text(
                                                      "Birthdate",
                                                      // lomlistdetails[index]['contact_no'] ??
                                                      //     "",
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
                                                      Mdeta[0]['birthdate'] ??
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
                                        const Spacer(),
                                        Mdeta[0]['anniversary'] == "" ||
                                                Mdeta[0]['anniversary'] ==
                                                    "0000-00-00" ||
                                                Mdeta[0]['anniversary'] == null
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
                                                      Mdeta[0]['anniversary'] ??
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
                                        const Spacer(),
                                        Mdeta[0]['joining_year'] == "" ||
                                                Mdeta[0]['joining_year'] == null
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
                                                      Mdeta[0][
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

  Memdetaapi() {
    ApiWrapper.dataGet(AppUrl.Memberdeta + memid.toString()).then((val) {
      setState(() {
        Loomd = true;
      });
      if ((val != null) && (val.isNotEmpty)) {
        setState(() {});
        Mdeta.clear();
        val.forEach((e) {
          Mdeta.add(e);
        });
        Loomd = false;
        setState(() {});
      } else {
        setState(() {});
        Loomd = false;
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
