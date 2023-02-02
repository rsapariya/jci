import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jci/Home/home.dart';
import 'package:jci/units/Storage.dart';
import 'package:jci/units/colour.dart';

import '../../splaysh.dart';

class LomDeteils extends StatefulWidget {
  const LomDeteils({Key? key}) : super(key: key);

  @override
  State<LomDeteils> createState() => _LomDeteilsState();
}

class _LomDeteilsState extends State<LomDeteils> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "LOM Activites",
            style: GoogleFonts.poppins(),
          ),
          backgroundColor:Color(Appbarcolour.hashCode),
        ),
        body: ListView.builder(
          itemCount: lomactlist.length,
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
                        color: Color(Appbarcolour.hashCode)!,
                        borderRadius: BorderRadius.only(
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
                                // backgroundColor: Color(Appbarcolour)!!.withOpacity(0.7),
                                backgroundImage: NetworkImage(backimage),
                                radius: 30,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                backgroundImage: lomactlist[index]
                                                ['featured_img'] ==
                                            null ||
                                        lomactlist[index]['featured_img'] == ""
                                    ? NetworkImage(backimage)
                                    : NetworkImage(
                                        lomactlist[index]['featured_img']),
                                radius: 30,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: Get.width / 1.5,
                                child: Text(
                                  lomactlist[index]['lom_name'],
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(
                                width: Get.width / 1.5,
                                child: Text(
                                  lomactlist[index]['project_name'],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
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
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(5),
                            bottomLeft: Radius.circular(5))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Get.width / 30, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          lomactlist[index]['objectives'] == null ||
                                  lomactlist[index]['objectives'] == ""
                              ? SizedBox()
                              : Text(
                                  "Objectives",
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                      color: Color(Appbarcolour.hashCode)!,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                          lomactlist[index]['objectives'] == null ||
                                  lomactlist[index]['objectives'] == ""
                              ? SizedBox()
                              : SizedBox(
                                  height: 5,
                                ),
                          lomactlist[index]['objectives'] == null ||
                                  lomactlist[index]['objectives'] == ""
                              ? SizedBox()
                              : SizedBox(
                                  width: Get.width / 1.2,
                                  child: Text(
                                    lomactlist[index]['objectives'] ?? "",
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              lomactlist[index]['area'] == "" ||
                                      lomactlist[index]['area'] == null
                                  ? SizedBox()
                                  : Text(
                                      "Area : ",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          color: Color(Appbarcolour.hashCode)!!,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                              lomactlist[index]['area'] == "" ||
                                      lomactlist[index]['area'] == null
                                  ? SizedBox()
                                  : SizedBox(
                                      width: Get.width / 3,
                                      child: Text(
                                        lomactlist[index]['area'] ?? "",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                              // Spacer(),
                              lomactlist[index]['from_date'] == "" ||
                                      lomactlist[index]['from_date'] == null
                                  ? SizedBox()
                                  : Text(
                                      "Form : ",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          color: Color(Appbarcolour.hashCode)!,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                              lomactlist[index]['from_date'] == "" ||
                                      lomactlist[index]['from_date'] == null
                                  ? SizedBox()
                                  : SizedBox(
                                      width: Get.width / 4,
                                      child: Text(
                                        lomactlist[index]['from_date'] ?? "",
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
