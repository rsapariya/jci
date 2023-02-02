import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jci/Home/Zonedirectory/Lomdetails.dart';
import '../../../units/Storage.dart';
import '../../../units/colour.dart';
import '../home.dart';
import 'Details.dart';
import '../../../splaysh.dart';
var lomid;
var lomname;

class Lomlist extends StatefulWidget {
  const Lomlist({Key? key}) : super(key: key);

  @override
  State<Lomlist> createState() => _LomlistState();
}

class _LomlistState extends State<Lomlist> {
  @override
  List dailog = [];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LOM',
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: Color(Appbarcolour.hashCode)!!,
      ),
      body: ListView.builder(
        itemCount: lomlist.length,
        itemBuilder: (_, index) {
          return Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Get.width / 20, vertical: 8),
            child: InkWell(
              onTap: () {
                setState(() {
                  lomid = lomlist[index]['lom_id'].toString();
                  lomname = lomlist[index]['lom_name'].toString();
                  Get.to(() => Lomdetails());
                });
              },
              child: Container(
                // height: Get.height / 4,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Color(Appbarcolour.hashCode)!!),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Get.height / 100, horizontal: Get.width / 30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: Get.width / 1.35,
                                child: Text(
                                  lomlist[index]['ch_name'].toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(
                            Icons.navigate_next_outlined,
                            color: Color(Appbarcolour.hashCode)!!,
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
