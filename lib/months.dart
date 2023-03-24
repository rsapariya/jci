import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jci/Home/home.dart';
import 'package:jci/splaysh.dart';
import 'package:jci/units/Storage.dart';

import 'Home/monthactivites.dart';

class Months extends StatefulWidget {
  const Months({Key? key}) : super(key: key);

  @override
  State<Months> createState() => _MonthsState();
}

class _MonthsState extends State<Months> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(Appbarcolour.hashCode),
          title: Text(
            'Months',
            style: TextStyle(
              fontFamily: "popins",
            ),
          ),
        ),
        body: GridView.builder(
          itemCount: Monthlkist.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (BuildContext context, int index) {
            bool isCurrentMonth = index == DateTime.now().month - 1;
            return Padding(
                padding: EdgeInsets.all(8),
                child:isCurrentMonth?InkWell(
                  onTap: () {
                    save("Mid", Monthlkist[index]['id']);
                    Get.to(() => MonthaActi());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(Appbarcolour.hashCode),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        Monthlkist[index]['month'].toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ): Monthlkist[index]['status'].toString() != 'locked'
                    ? InkWell(
                        onTap: () {
                          save("Mid", Monthlkist[index]['id']);
                          Get.to(() => MonthaActi());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(Appbarcolour.hashCode),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              Monthlkist[index]['month'].toString(),
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: Color(Appbarcolour.hashCode).withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            Monthlkist[index]['month'].toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ));
          },
        ));
  }
}
