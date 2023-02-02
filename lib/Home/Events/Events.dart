// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jci/Home/home.dart';

import '../../splaysh.dart';
import '../../units/colour.dart';

class Event extends StatefulWidget {
  const Event({Key? key}) : super(key: key);

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor:Color(Appbarcolour.hashCode),
          title: Text(
            'Events',
            style: GoogleFonts.poppins(),
          ),
        ),
        body: ListView.builder(
          itemCount: eventlist.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width / 30, vertical: 10),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5), //New
                              blurRadius: 3,
                              spreadRadius: 2)
                        ],
                        color: Color(Appbarcolour.hashCode),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5))),
                    child: SizedBox(
                      width: Get.width / 1.6,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: Get.width / 30),
                        child: Text(
                          eventlist[index]['name'],
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
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
                          vertical: 10, horizontal: Get.width / 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            // width: Get.width / 1.5,
                            child: Text(
                              eventlist[index]['description'],
                              maxLines: 2,
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            // width: Get.width / 1.5,
                            child: Text(
                              eventlist[index]['trainer'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Color(Appbarcolour.hashCode),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                width: Get.width / 1.3,
                                child: Text(
                                  eventlist[index]['location'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                " ₹ ",
                                style: TextStyle(
                                    color: Color(Appbarcolour.hashCode)!!, fontSize: 20),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                width: Get.width / 1.3,
                                child: Text(
                                  eventlist[index]['fees'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.calendar_month_sharp,
                                color: Color(Appbarcolour.hashCode),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                width: Get.width / 1.3,
                                child: Text(
                                  "${eventlist[index]['from_date'] + " To " + eventlist[index]['to_date'] ?? ""}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.access_time,
                                color: Color(Appbarcolour.hashCode),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                width: Get.width / 1.3,
                                child: Text(
                                  "${eventlist[index]['start_time'] + " To " + eventlist[index]['end_time'] ?? ""}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: Text(
                                  "Created On :",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    color: Color(Appbarcolour.hashCode)!,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                // width: Get.width / 1.3,
                                child: Text(
                                  eventlist[index]['created_on'] ?? "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
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
            );
          },
        ));
  }
}

