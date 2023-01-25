import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jci/Details.dart';
import 'package:jci/Storage.dart';
import 'package:jci/colour.dart';

class Forth extends StatefulWidget {
  const Forth({Key? key}) : super(key: key);

  @override
  State<Forth> createState() => _ForthState();
}

class _ForthState extends State<Forth> {
  @override
  List dailog = [];
  List<dynamic> Directory = [
    {
      "Name": "JC Anant Bharucha",
      "Position": "Zone President",
      "home": "JCI Surat Metro",
      "call": "9857498742",
      "email": "test@gmail.com",
      "location": "Surat",
      "image": "https://cdn-icons-png.flaticon.com/512/149/149071.png"
    },
    {
      "Name": "JC Nirav Bharucha",
      "Position": "Zone President",
      "home": "JCI Surat Metro",
      "call": "9857498742",
      "email": "test@gmail.com",
      "location": "Surat",
      "image": "https://cdn-icons-png.flaticon.com/512/149/149071.png"
    },
    {
      "Name": "JC Anant Patel",
      "Position": "Zone President",
      "home": "JCI Surat Metro",
      "call": "9857498742",
      "email": "test@gmail.com",
      "location": "Surat",
      "image": "https://cdn-icons-png.flaticon.com/512/149/149071.png"
    },
    {
      "Name": "JC Anant chauhan",
      "Position": "Zone President",
      "home": "JCI Surat Metro",
      "call": "9857498742",
      "email": "test@gmail.com",
      "location": "Surat",
      "image": "https://cdn-icons-png.flaticon.com/512/149/149071.png"
    },
    {
      "Name": "JC Anant Bharucha",
      "Position": "Zone co President",
      "home": "JCI Surat Metro",
      "call": "48488755",
      "email": "test@gmail.com",
      "location": "Surat",
      "image": "https://cdn-icons-png.flaticon.com/512/149/149071.png"
    },
    {
      "Name": "JC Anant Bharucha",
      "Position": "Zone President",
      "home": "JCI Surat Metro",
      "call": "9857498742",
      "email": "test@gmail.com",
      "location": "Surat",
      "image": "https://cdn-icons-png.flaticon.com/512/149/149071.png"
    },
    {
      "Name": "JC Anant Bharucha",
      "Position": "Zone President",
      "home": "JCI Surat Metro",
      "call": "9857498742",
      "email": "test@gmail.com",
      "location": "Surat",
      "image": "https://cdn-icons-png.flaticon.com/512/149/149071.png"
    },
  ];
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        // controller: controller,
        itemCount: Directory.length,
        itemBuilder: (_, index) {
          return Padding(
            padding:
            EdgeInsets.symmetric(horizontal: Get.width / 20, vertical: 10),
            child: InkWell(
              onTap: () {
                setState(() {
                  save('National', Directory[index]);
                  Get.to(() => Detailes());
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Appbarcolour),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Get.height / 60, horizontal: Get.width / 30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              Directory[index]['image'].toString(),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: Get.width / 1.5,
                                child: Text(
                                  Directory[index]['Name'].toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(fontSize: 16),
                                ),
                              ),
                              SizedBox(
                                width: Get.width / 1.5,
                                child: Text(
                                  Directory[index]['Position'].toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(fontSize: 16),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
