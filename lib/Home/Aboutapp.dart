import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jci/units/Storage.dart';
import '../../../splaysh.dart';

class Aboutinfo extends StatefulWidget {
  const Aboutinfo({Key? key}) : super(key: key);

  @override
  State<Aboutinfo> createState() => _AboutinfoState();
}

class _AboutinfoState extends State<Aboutinfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("App info", style: GoogleFonts.poppins()),
        backgroundColor: Color(Appbarcolour.hashCode),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/VIII_Logo_2023_clipdrop-enhance.jpg',
              scale: 7,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Developed by :- Zresthine Technologies",
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  textStyle: TextStyle(
                    color: Color(Appbarcolour.hashCode),
                  )),
            ),
            Text(
              'Version 0.0.${getdata.read('varsion')}',
              style: GoogleFonts.poppins(
                  fontSize: 16, textStyle: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
