import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../splaysh.dart';
import '../units/api.dart';
import '../units/storage.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  bool npaas = true;
  bool loding = false;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(Appbarcolour.hashCode),
        title: Text("Login"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height / 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/VIII_Logo_2023_clipdrop-enhance.jpg",
                      scale: 15,
                    ),
                    SizedBox(
                      width: Get.width / 20,
                    ),
                    Column(
                      children: const [
                        Text(
                          "Hey there,",
                          style: TextStyle(
                              fontFamily: "popins",
                              color: Colors.black,
                              fontSize: 22),
                        ),
                        Text(
                          "Login",
                          style: TextStyle(
                              fontFamily: "popins Medium",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: Get.height / 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter username";
                    } else {
                      return null;
                    }
                  },
                  style: const TextStyle(
                    fontFamily: "popins",
                  ),
                  autofocus: false,
                  controller: phone,
                  decoration: buildInputDecoration(
                    hintText: "Enter Username",
                    lbltext: "Enter Username",
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter password!";
                    }
                    return null;
                  },
                  style: const TextStyle(
                    fontFamily: "popins",
                  ),
                  controller: password,
                  autofocus: false,
                  obscureText: npaas,
                  decoration: buildInputDecoration(
                    hintText: "Password",
                    lbltext: "Password",
                    surfix: InkWell(
                      onTap: () {
                        setState(() {
                          npaas = !npaas;
                        });
                      },
                      child: Icon(
                        Icons.remove_red_eye_outlined,
                        color: Color(Appbarcolour.hashCode),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () async {
                    if (loding == false) {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          loding = true;
                        });
                        loginapi();
                      }
                    }
                  },
                  child: Container(
                    height: Get.height / 15,
                    width: Get.width / 1.8,
                    decoration: BoxDecoration(
                        color: Color(Appbarcolour.hashCode),
                        borderRadius: BorderRadius.circular(40)),
                    child: loding == false
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: "popins"),
                              ),
                            ],
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 3,
                            ),
                          ),
                  ),
                ),
                SizedBox(
                  height: Get.height / 10,
                ),
              ],
            ),
          ),
        ),
      ),
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
        color: Color(Appbarcolour.hashCode),
      ),
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
          color: Color(Appbarcolour.hashCode),
          width: 1,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: const BorderSide(
          color: Colors.red,
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

  loginapi() async {
    var request = http.MultipartRequest('POST', Uri.parse(AppUrl.login));
    request.fields.addAll({'username': phone.text, 'password': password.text});
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    var val = jsonDecode(respStr);
    if (response.statusCode == 200) {
      if (val['success'] == true) {
        setState(() {
          save('islogin', true);
        });
        setState(() {
          save('logindata', val);
        });
        ApiWrapper.showToastMessage('Login Successfully');
        GetMonths();
      } else {
        setState(() {
          loding = false;
        });
        ApiWrapper.showToastMessage('Login failed');
      }
    } else {
      setState(() {
        loding = false;
      });
      ApiWrapper.showToastMessage('Login failed');
    }
  }

  GetMonths() async {
    print("------- MONTHS ------------");

    var request = http.MultipartRequest('GET', Uri.parse(AppUrl.Months));
    var headers = {'x-api-key': getdata.read('logindata')['token'].toString()};
    request.headers.addAll(headers);
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    var val = jsonDecode(respStr);
    if (response.statusCode == 200) {
      setState(() {
        Monthlkist.clear();
      });
      setState(() {
        save('Mon', val);
        getdata.read('Mon').forEach((e) {
          Monthlkist.add(e);
        });
        loding = false;
      });
      Get.back();
      print("------- MONTHS ---------SS---$val");
    } else {
      setState(() {
        loding = false;
      });
      print("------- MONTHS ---------EE---$val");
    }
  }
}
