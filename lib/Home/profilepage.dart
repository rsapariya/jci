import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jci/splaysh.dart';

import '../units/Storage.dart';

class Editpro extends StatefulWidget {
  const Editpro({Key? key}) : super(key: key);

  @override
  State<Editpro> createState() => _EditproState();
}

class _EditproState extends State<Editpro> {
  TextEditingController fullname = TextEditingController(
      text: getdata.read('logindata')['userdata']['user_name'] ?? "");
  TextEditingController email = TextEditingController(
      text: getdata.read('logindata')['userdata']['user_email'] ?? "Email");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(Appbarcolour.hashCode),
        centerTitle: true,
        title: Text("Profile"),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.1),
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                    ),
                  ),
                  // const Positioned(
                  //     top: 68,
                  //     left: 68,
                  //     child: CircleAvatar(
                  //       backgroundColor: Colors.white,
                  //       radius: 17,
                  //     )),
                  // const Positioned(
                  //     top: 70,
                  //     left: 70,
                  //     child: CircleAvatar(
                  //         backgroundColor: Colors.blue,
                  //         radius: 15,
                  //         child: Center(
                  //             child: Icon(
                  //           Icons.edit,
                  //           size: 20,
                  //           color: Colors.white,
                  //         )))),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                style: const TextStyle(
                  fontFamily: "popins",
                ),
                readOnly: true,
                controller: fullname,
                autofocus: false,
                decoration: buildInputDecoration(
                  lbltext: "Username",
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                style: const TextStyle(
                  fontFamily: "popins",
                ),
                readOnly: true,
                controller: email,
                autofocus: false,
                decoration: buildInputDecoration(
                  lbltext: "Email",
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: Get.height / 20,
              ),
            ],
          ),
        ),
      )),
    );
  }

  InputDecoration buildInputDecoration({
    String? hintText,
    prifix,
    surfix,
    String? lbltext,
  }) {
    return InputDecoration(
      prefixIcon: prifix,
      suffixIcon: surfix,
      hintText: hintText,
      hintStyle: const TextStyle(fontFamily: "popins", fontSize: 14),
      labelStyle: TextStyle(
          fontFamily: "popins",
          fontSize: 14,
          color: Color(Appbarcolour.hashCode)),
      labelText: lbltext,
      contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
              color: Colors.white,
              width: 0.5,
              strokeAlign: StrokeAlign.center)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide(
          width: 1,
          color: Colors.transparent,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
      ),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.1),
    );
  }
}
