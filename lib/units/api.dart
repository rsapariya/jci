// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class ApiWrapper {
  static var headers = {
    'x-api-key':
        'MjYyYjJiNDc4YzQ5ODA5ZTEyYjM2ZjI1ZTgxMzZlZWJjMDlkYmVmYzFhZTJjNGIzMWJiMTIyNGJkYmRjMjEwOA=='
  };
  // static doImageUpload(
  //     String endpoint, Map<String, String> params, List imgs) async {
  //   var request = http.MultipartRequest('POST', Uri.parse(AppUrl.atandence));
  //   request.fields.addAll(params);
  //   for (int i = 0; i < imgs.length; i++) {
  //     log(imgs[i].toString(), name: "Image name $i");
  //     request.files.add(await http.MultipartFile.fromPath('image$i', imgs[i]));
  //   }
  //   request.headers.addAll(headers);
  //   http.StreamedResponse response = await request.send();
  //   var model = await response.stream.bytesToString();
  //   return jsonDecode(model);
  // }

  static showToastMessage(message) {
    Fluttertoast.showToast(
        msg: message,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black.withOpacity(0.5),
        textColor: Colors.white,
        fontSize: 14.0);
  }

  static dataPost(appUrl, method) async {
    try {
      var url = Uri.parse(appUrl);
      print(url);
      print(method);
      var request =
          await http.post(url, headers: headers, body: jsonEncode(method));
      var response = jsonDecode(request.body);
      print("response----- $response");
      if (request.statusCode == 200) {
        return response;
      } else {
        return response;
      }
    } catch (e) {
      return e;
    }
  }

  static dataGet(appUrl) async {
    try {
      var url = Uri.parse(appUrl);
      var request = await http.get(url, headers: headers);
      var response = jsonDecode(request.body);
      if (request.statusCode == 200) {
        return response;
      } else {
        print(request.reasonPhrase);
      }
    } catch (e) {
      return e;
    }
  }

  static dataGetLocation(appUrl) async {
    try {
      var request = await http.get(appUrl, headers: headers);
      var response = jsonDecode(request.body);
      if (request.statusCode == 200) {
        return response;
      } else {
        print(request.reasonPhrase);
      }
    } catch (e) {
      print("Exeption----- $e");
    }
  }
}

class AppUrl {
  static const String baseurl = 'http://jciindiazone8.in/api/api/';
  static const String Current = baseurl + 'zgbs';
  static const String PasrPR = baseurl + 'past_zps';
  static const String PasrNational = baseurl + 'national_presidents';
  static const String Trainers = baseurl + 'trainers/8';
  static const String Lom = baseurl + 'lom/8';
  static const String Lomdetail = baseurl + 'lgb/';
  static const String Events = baseurl + 'events/8';
  static const String Lomactivity = baseurl + 'lom_activity';
  static const String Headquaters = baseurl + 'headquarter';
  static const String Youtube = baseurl + 'videos';
  static const String slider = baseurl + 'slider';
}
