import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jci/Home/Zonedirectory/Trainers/Details.dart';
import '../../../../units/Storage.dart';
import '../../../../units/colour.dart';
import '../../home.dart';
import '../Details.dart';

class Nationaltrainers extends StatefulWidget {
  const Nationaltrainers({Key? key}) : super(key: key);

  @override
  State<Nationaltrainers> createState() => _NationaltrainersState();
}

class _NationaltrainersState extends State<Nationaltrainers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'National Trainers',
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: Appbarcolour,
      ),
      body: ListView.builder(
        // controller: controller,
        itemCount: trainers.length,
        itemBuilder: (_, index) {
          return Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Get.width / 20, vertical: 10),
            child: InkWell(
              onTap: () {
                setState(() {
                  save('TR', trainers[index]);
                  Get.to(() => TrainersDetails());
                });
              },
              child: Container(
                // height: Get.height / 4,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Appbarcolour),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Get.height / 100, horizontal: Get.width / 30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: trainers[index]['image']!= null
                                ? NetworkImage(
                                trainers[index]['image'])
                                : NetworkImage(backimage),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: Get.width / 1.8,
                                child: Text(
                                  trainers[index]['name'].toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(fontSize: 16),
                                ),
                              ),trainers[index]['post']==null || trainers[index]['post'] == ""?SizedBox():
                              SizedBox(
                                width: Get.width / 1.8,
                                child: Text(
                                  trainers[index]['post'].toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(
                            Icons.navigate_next_outlined,
                            color: Appbarcolour,
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
