import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jci/Home/Zonedirectory/lomtabs.dart';
import 'package:jci/Home/Zonedirectory/memberdetails.dart';

import '../../splaysh.dart';
import '../../units/Storage.dart';
import '../home.dart';

class Members extends StatefulWidget {
  const Members({Key? key}) : super(key: key);

  @override
  State<Members> createState() => _MembersState();
}

class _MembersState extends State<Members> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Loom == false
          ? ListView.builder(
              itemCount: Memberlist.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width / 20, vertical: 10),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        save('Mdeta', Memberlist[index]);
                        Get.to(
                          () => const memberdetai(),
                          transition: Transition.rightToLeft,
                        );
                      });
                    },
                    child: Container(
                      // height: Get.height / 4,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 1, color: Color(Appbarcolour.hashCode)),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Get.height / 100,
                            horizontal: Get.width / 30),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Stack(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          Color(Appbarcolour.hashCode),
                                      backgroundImage: NetworkImage(backimage),
                                    ),
                                    CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      backgroundImage:
                                          Memberlist[index]['image'] != null
                                              ? NetworkImage(
                                                  Memberlist[index]['image']
                                                      .toString(),
                                                )
                                              : NetworkImage(backimage),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      width: Get.width / 1.8,
                                      child: Text(
                                        Memberlist[index]['name'].toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            GoogleFonts.poppins(fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.navigate_next_outlined,
                                  color: Color(Appbarcolour.hashCode),
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
            )
          : Center(
              child: CircularProgressIndicator(
                color: Appbarcolour,
              ),
            ),
    );
  }
}
