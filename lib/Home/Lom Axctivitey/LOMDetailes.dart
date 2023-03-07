// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jci/Home/home.dart';

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
          backgroundColor: Color(Appbarcolour.hashCode),
        ),
        body: LayoutBuilder(builder: (_, e) {
          return ListView.builder(
            itemCount: lomactlist.length,
            itemBuilder: (_, index) {
              final width = e.maxWidth;
              var fontSize = 16.0;
              if (width <= 480) {
                fontSize = 15.0;
              } else if (width > 480) {
                fontSize = 22.0;
              } else {
                fontSize = 28.0;
              }
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
                                  // backgroundColor: Color(Appbarcolour)!!.withOpacity(0.7),
                                  backgroundImage: NetworkImage(backimage),
                                  radius: 30,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: lomactlist[index]
                                                  ['featured_img'] ==
                                              null ||
                                          lomactlist[index]['featured_img'] ==
                                              ""
                                      ? NetworkImage(backimage)
                                      : NetworkImage(
                                          lomactlist[index]['featured_img']),
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
                                    lomactlist[index]['lom_name'] ?? "",
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: fontSize,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width / 1.5,
                                  child: Text(
                                    "Date : ${lomactlist[index]['from_date']}",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
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
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Get.width / 30, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                lomactlist[index]['project_name'] == null ||
                                        lomactlist[index]['project_name'] == ""
                                    ? const SizedBox()
                                    : Text(
                                        "Project Name",
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                            color: Color(Appbarcolour.hashCode),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                Spacer(),
                                lomactlist[index]['area'] == null ||
                                        lomactlist[index]['area'] == ""
                                    ? const SizedBox()
                                    : Text(
                                        "Area-",
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                            color: Color(Appbarcolour.hashCode),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                lomactlist[index]['area'] == null ||
                                        lomactlist[index]['area'] == ""
                                    ? const SizedBox()
                                    : SizedBox(
                                  width:Get.width/3.5,
                                        child: Text(
                                          lomactlist[index]['area'] ?? "",
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                              ],
                            ),
                            lomactlist[index]['project_name'] == null ||
                                    lomactlist[index]['project_name'] == ""
                                ? const SizedBox()
                                : const SizedBox(
                                    height: 5,
                                  ),
                            lomactlist[index]['project_name'] == null ||
                                    lomactlist[index]['project_name'] == ""
                                ? const SizedBox()
                                : SizedBox(
                                    width: Get.width / 1.2,
                                    child: Text(
                                      lomactlist[index]['project_name'] ?? "",
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }));
  }
}
