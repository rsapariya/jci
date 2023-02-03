import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jci/Home/Zonedirectory/National%20Headquaters/second.dart';
import 'package:jci/Home/Zonedirectory/National%20Headquaters/third.dart';
import '../../../splaysh.dart';
import '../../../units/colour.dart';
import 'Fifth.dart';
import 'Forth.dart';
import 'Six.dart';
import 'first.dart';

class Nationalheadquaters extends StatefulWidget {
  const Nationalheadquaters({Key? key}) : super(key: key);

  @override
  State<Nationalheadquaters> createState() => _NationalheadquatersState();
}

class _NationalheadquatersState extends State<Nationalheadquaters>
    with SingleTickerProviderStateMixin {
  @override
  late TabController _tabController;
  void initState() {
    _tabController = TabController(vsync: this, length: 6);
    super.initState();
  }

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
      appBar: AppBar(
        title: Text(
          'National Headquarters',
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: Color(Appbarcolour.hashCode)!!,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Color(Appbarcolour.hashCode)!!, width: 1.5))),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Get.height / 80, horizontal: 10),
              child: TabBar(
                unselectedLabelColor: Color(Appbarcolour.hashCode)!!,
                indicatorColor: Color(Appbarcolour.hashCode)!!,
                isScrollable: true,
                labelPadding: EdgeInsets.all(10),
                controller: _tabController,
                // indicatorPadding: const EdgeInsets.all(30),
                indicator: BoxDecoration(
                    color: Color(Appbarcolour.hashCode)!!,
                    borderRadius: BorderRadius.circular(40)),
                tabs: [
                  Text(
                    'Secratory',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  Text(
                    'Area Wise',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  Text(
                    'Membership',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  Text(
                    'Finance',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  Text(
                    '  PO  ',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  Text(
                    'SubStaff',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                First(),
                Second(),
                Third(),
                Forth(),
                Fifth(),
                Sixth()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
