
// ignore_for_file: annotate_overrides, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../splaysh.dart';

import '../../units/api.dart';
import '../home.dart';
import 'Lgb.dart';
import 'Lom.dart';
import 'Lomdetails.dart';

bool Loom = true;

class lomtabes extends StatefulWidget {
  const lomtabes({Key? key}) : super(key: key);

  @override
  State<lomtabes> createState() => _lomtabesState();
}

class _lomtabesState extends State<lomtabes>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
    Memberapi();
    LomdetailApi();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          lomname,
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: Color(Appbarcolour.hashCode),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Color(Appbarcolour.hashCode), width: 1.5))),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Get.height / 80, horizontal: 10),
              child: TabBar(
                unselectedLabelColor: Color(Appbarcolour.hashCode),
                indicatorColor: Color(Appbarcolour.hashCode),
                // isScrollable: true,
                labelPadding: const EdgeInsets.all(10),
                controller: _tabController,
                indicator: BoxDecoration(
                    color: Color(Appbarcolour.hashCode),
                    borderRadius: BorderRadius.circular(40)),
                tabs: [
                  Text(
                    'LGB',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  Text(
                    'Members',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [Lomdetails(), Members()],
            ),
          ),
        ],
      ),
    );
  }

  Memberapi() {
    ApiWrapper.dataGet(AppUrl.Member + lomid.toString()).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        setState(() {});
        Memberlist.clear();
        val.forEach((e) {
          Memberlist.add(e);
        });
        Loom = false;
        // Memberlist.sort((a, b) =>
        //     (int.parse(a['priority'])).compareTo(int.parse(b['priority'])));
        // Loding = false;
      } else {
        setState(() {});
        Loom = false;
        Memberlist.clear();
        ApiWrapper.showToastMessage("Something Went Wrong!!");
      }
    });
  }

  LomdetailApi() {
    ApiWrapper.dataGet(AppUrl.Lomdetail + lomid.toString()).then((val) {
      if ((val != null) && (val.isNotEmpty)) {
        setState(() {});
        lomlistdetails.clear();
        val.forEach((e) {
          lomlistdetails.add(e);
        });
        Loom = false;
        lomlistdetails.sort((a, b) =>
            (int.parse(a['priority'])).compareTo(int.parse(b['priority'])));
        // Loding = false;
      } else {
        setState(() {});
        Loom = false;
        lomlistdetails.clear();
        ApiWrapper.showToastMessage("Something Went Wrong!!");
      }
    });
  }
}
