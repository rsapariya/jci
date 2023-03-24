import 'dart:convert';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jci/splaysh.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../units/Storage.dart';
import '../units/api.dart';
import 'monthactivites.dart';

List<Map> myJson = [];
List<Map> Type = [
  {"name": "JJ"},
  {"name": "JCI"}
];

String image = "https://cdn-icons-png.flaticon.com/512/3135/3135715.png";

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  String? _selected = myJson[0]['id'];
  String? _selected2 = Type[0]['name'];
  File? imageFile;
  bool loding = false;
  TextEditingController projectname = new TextEditingController();
  TextEditingController month = new TextEditingController();
  TextEditingController date = new TextEditingController();
  TextEditingController area = new TextEditingController();
  TextEditingController type = new TextEditingController();
  TextEditingController stardate = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add Project",
          style: TextStyle(fontFamily: "popins"),
        ),
        backgroundColor: Color(Appbarcolour.hashCode),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
        child: SingleChildScrollView(
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height / 60,
                  ),
                  Stack(
                    children: [
                      imageFile == null
                          ? CircleAvatar(
                              backgroundColor: Colors.grey.withOpacity(0.1),
                              radius: 50,
                              backgroundImage: NetworkImage(image),
                            )
                          : CircleAvatar(
                              backgroundColor: Colors.grey.withOpacity(0.1),
                              radius: 50,
                              backgroundImage: FileImage(imageFile!),
                            ),
                      const Positioned(
                          top: 68,
                          left: 68,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 17,
                          )),
                      Positioned(
                        top: 70,
                        left: 70,
                        child: InkWell(
                          child: CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 15,
                            child: Center(
                              child: Icon(
                                Icons.add,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          onTap: () {
                            _getFromGallery();
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height / 60,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Project Name';
                      }
                      return null;
                    },
                    controller: projectname,
                    style: const TextStyle(
                      fontFamily: "popins",
                    ),
                    autofocus: false,
                    decoration: buildInputDecoration(
                      hintText: "Project name",
                      lbltext: "Project name",
                    ),
                  ),
                  SizedBox(
                    height: Get.height / 60,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (stardate.text == null || stardate.text.isEmpty) {
                        return 'Select Date';
                      }
                      return null;
                    },
                    style: TextStyle(
                      fontFamily: "popins",
                    ),
                    controller: stardate,
                    autofocus: false,
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101));
                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        setState(() {
                          stardate.text = formattedDate;
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                    decoration: buildInputDecoration(
                      hintText: "Select Date",
                      lbltext: "Select Date",
                      surfix: Icon(
                        Icons.calendar_month_sharp,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height / 60,
                  ),
                  Container(
                    width: double.infinity,
                    height: Get.height / 15,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10)),
                    child: drop(),
                  ),
                  SizedBox(
                    height: Get.height / 60,
                  ),
                  Container(
                    width: double.infinity,
                    height: Get.height / 15,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10)),
                    child: drop2(),
                  ),
                  SizedBox(
                    height: Get.height / 60,
                  ),
                  SizedBox(
                    height: Get.height / 40,
                  ),
                  InkWell(
                    onTap: () async {
                      if (loding == false) {
                        if (formKey.currentState!.validate()) {
                          loding = true;
                          setState(() {});

                          Addprojects();
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
                                  "Add",
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
                    height: Get.height / 60,
                  ),
                ],
              )),
        ),
      ),
    );
  }

  drop() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Row(
          children: const [
            Expanded(
              child: Text(
                'Select area',
                style: TextStyle(
                    fontSize: 14, color: Colors.blue, fontFamily: 'popins'),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: myJson
            .map((Map map) => DropdownMenuItem<String>(
                  value: map["id"].toString(),
                  child: Text(
                    map['name'].toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'popins',
                      color: Colors.blue,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        value: _selected,
        onChanged: (value) {
          setState(() {
            _selected = value as String;
          });
        },
        buttonStyleData: ButtonStyleData(
          height: 50,
          width: 160,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_forward_ios_outlined,
          ),
          iconSize: 14,
          iconEnabledColor: Colors.blue,
        ),
        dropdownStyleData: DropdownStyleData(
          padding: null,
          maxHeight: 200,
          elevation: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }

  drop2() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Row(
          children: const [
            Expanded(
              child: Text(
                'Select type',
                style: TextStyle(
                    fontSize: 14, color: Colors.blue, fontFamily: 'popins'),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: Type.map((Map map) => DropdownMenuItem<String>(
              value: map["name"].toString(),
              child: Text(
                map['name'].toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'popins',
                  color: Colors.blue,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            )).toList(),
        value: _selected2,
        onChanged: (value) {
          setState(() {
            _selected2 = value as String;
          });
        },
        buttonStyleData: ButtonStyleData(
          height: 50,
          width: 160,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_forward_ios_outlined,
          ),
          iconSize: 14,
          iconEnabledColor: Colors.blue,
        ),
        dropdownStyleData: DropdownStyleData(
          padding: null,
          maxHeight: 200,
          elevation: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
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
          width: 1,
          color: Colors.blue,
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

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        print(imageFile?.path.toString());
      });
    }
  }

  Addprojects() async {
    print("------- Addprojects ------------");
    var request = http.MultipartRequest('POST', Uri.parse(AppUrl.Addproject));
    var headers = {'x-api-key': getdata.read('logindata')['token'].toString()};
    request.headers.addAll(headers);
    request.fields.addAll({
      'project_name': projectname.text.toString(),
      'month': getdata.read('Mid').toString(),
      'date': stardate.text,
      'area': _selected.toString(),
      'type': _selected2.toString()
    });

    imageFile == null
        ? ""
        : request.files.add(await http.MultipartFile.fromPath(
            'img1', imageFile!.path.toString()));
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    var val = jsonDecode(respStr);
    if (response.statusCode == 200) {
      if (val['status'] == true) {
        setState(() {
          loding = false;
        });
        ApiWrapper.showToastMessage('Add Successfully.');
        Get.off(() => MonthaActi(), transition: Transition.fade);
      } else {
        setState(() {
          loding = false;
        });
      }

      print("------- Addprojects ---------SS---$val");
    } else {
      setState(() {
        loding = false;
      });
      print("------- Addprojects ---------EE---$val");
    }
  }
}
