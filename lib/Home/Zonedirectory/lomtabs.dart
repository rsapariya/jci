import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../splaysh.dart';

import '../home.dart';
import 'Lgb.dart';
import 'Lom.dart';
import 'Lomdetails.dart';

class lomtabes extends StatefulWidget {
  const lomtabes({Key? key}) : super(key: key);

  @override
  State<lomtabes> createState() => _lomtabesState();
}

class _lomtabesState extends State<lomtabes>
    with SingleTickerProviderStateMixin {
  @override
  late TabController _tabController;
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          lomname,
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: Color(Appbarcolour.hashCode)!!,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
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
                // isScrollable: true,
                labelPadding: EdgeInsets.all(10),
                controller: _tabController,
                indicator: BoxDecoration(
                    color: Color(Appbarcolour.hashCode)!!,
                    borderRadius: BorderRadius.circular(40)),
                tabs: [
                  Text(
                    'Members',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  Text(
                    'LGB',
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
              children: const [Lomdetails(), Lgbinfo()],
            ),
          ),
        ],
      ),
    );
  }
}
