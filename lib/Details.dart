import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jci/colour.dart';

import 'Storage.dart';

class Detailes extends StatefulWidget {
  const Detailes({Key? key}) : super(key: key);

  @override
  State<Detailes> createState() => _DetailesState();
}

class _DetailesState extends State<Detailes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Appbarcolour,
        title: Text(
          'Details',
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width / 30, vertical: Get.height / 50),
        child: Container(
          height: Get.height / 3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Appbarcolour)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width / 30, vertical: Get.height / 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage(getdata.read('ZGB')['image']),
                      radius: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: Get.width / 1.8,
                          child: Text(
                            getdata.read('ZGB')['Name'],
                            style: GoogleFonts.poppins(fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          width: Get.width / 1.8,
                          child: Text(
                            getdata.read('ZGB')['Position'],
                            style: GoogleFonts.poppins(fontSize: 18),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(Icons.home),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: Get.width / 1.5,
                      child: Text(
                        getdata.read('ZGB')['home'],
                        style: GoogleFonts.poppins(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.call),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: Get.width / 1.5,
                      child: Text(
                        getdata.read('ZGB')['call'],
                        style: GoogleFonts.poppins(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.email),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: Get.width / 1.5,
                      child: Text(
                        getdata.read('ZGB')['email'],
                        style: GoogleFonts.poppins(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.location_on),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: Get.width / 1.5,
                      child: Text(
                        getdata.read('ZGB')['location'],
                        style: GoogleFonts.poppins(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
