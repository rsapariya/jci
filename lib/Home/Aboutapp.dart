import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jci/units/colour.dart';

class Aboutinfo extends StatefulWidget {
  const Aboutinfo({Key? key}) : super(key: key);

  @override
  State<Aboutinfo> createState() => _AboutinfoState();
}

class _AboutinfoState extends State<Aboutinfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("App info", style: GoogleFonts.poppins()),
        backgroundColor: Appbarcolour,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splay.png',
              scale: 2.5,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Initiative by :- Zone President 2020 Divyang Natali",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                color: Appbarcolour,
              )),
            ),
            Text(
              "Devloped by :- Zresthine Technologies",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                color: Appbarcolour,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
