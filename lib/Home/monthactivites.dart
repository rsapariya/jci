// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jci/Home/home.dart';
import 'package:jci/Home/projects.dart';
import 'package:jci/units/Storage.dart';

import '../../splaysh.dart';
import '../units/api.dart';

List MActi = [];

class MonthaActi extends StatefulWidget {
  const MonthaActi({Key? key}) : super(key: key);

  @override
  State<MonthaActi> createState() => _MonthaActiState();
}

class _MonthaActiState extends State<MonthaActi> {
  @override
  bool loding = true;

  void initState() {
    ActiMonthapi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => Projects(), transition: Transition.leftToRight);
          },
          child: Icon(Icons.add),
          backgroundColor: Color(Appbarcolour.hashCode),
        ),
        appBar: AppBar(
          title: Text("LOM Activites", style: GoogleFonts.poppins()),
          backgroundColor: Color(Appbarcolour.hashCode),
        ),
        body: loding == false
            ? MActi.isNotEmpty
                ? LayoutBuilder(builder: (_, e) {
                    return ListView.builder(
                      itemCount: MActi.length,
                      itemBuilder: (_, index) {
                        final width = e.maxWidth;
                        var fontSize = 16.0;
                        if (width <= 480) {
                          fontSize = 16.0;
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
                                    border: Border.all(
                                        color: Color(Appbarcolour.hashCode)),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Get.width / 30, vertical: 10),
                                  child: Row(
                                    children: [
                                      Stack(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage:
                                                NetworkImage(backimage),
                                            radius: 30,
                                          ),
                                          CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            backgroundImage: MActi[index]
                                                            ['img1'] ==
                                                        null ||
                                                    MActi[index]['img1'] == ""
                                                ? NetworkImage(backimage)
                                                : NetworkImage(
                                                    MActi[index]['img1']),
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
                                              MActi[index]['project_name'] ??
                                                  "",
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                  color: Color(
                                                      Appbarcolour.hashCode),
                                                  fontSize: fontSize,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          SizedBox(
                                            width: Get.width / 1.5,
                                            child: Text(
                                              "Date : ${MActi[index]['from_date']}",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: GoogleFonts.poppins(
                                                color: Color(
                                                    Appbarcolour.hashCode),
                                              ),
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
                    );
                  })
                : Center(
                    child: Text(
                      'No data',
                      style: GoogleFonts.poppins(
                          fontSize: 20, color: Color(Appbarcolour.hashCode)),
                    ),
                  )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }

  ActiMonthapi() {
    ApiWrapper.dataGet(
            "http://jciindiazone8.in/api/api/activities/${getdata.read('logindata')['userdata']['lom_id']}/${getdata.read('Mid')}")
        .then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        setState(() {});
        MActi.clear();
        val.forEach((e) {
          MActi.add(e);
        });
        setState(() {
          loding = false;
        });
      } else {
        setState(() {
          MActi.clear();
          loding = false;
        });
        ApiWrapper.showToastMessage('No data activities were found');
      }
    });
  }
}
