
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jci/Home/Zonedirectory/National%20Headquaters/second.dart';
import 'package:jci/Home/Zonedirectory/National%20Headquaters/third.dart';
import '../../../splaysh.dart';
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
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 6);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'National Headquarters',
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: Color(Appbarcolour.hashCode),
      ),
      body: Column(
        children: [
          Container(
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
                isScrollable: true,
                labelPadding: const EdgeInsets.all(10),
                controller: _tabController,
                // indicatorPadding: const EdgeInsets.all(30),
                indicator: BoxDecoration(
                    color: Color(Appbarcolour.hashCode),
                    borderRadius: BorderRadius.circular(40)),
                tabs: [
                  Text(
                    'Secratory',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  Text(
                    'Area Wise',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  Text(
                    'Membership',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  Text(
                    'Finance',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  Text(
                    '  PO  ',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  Text(
                    'SubStaff',
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
