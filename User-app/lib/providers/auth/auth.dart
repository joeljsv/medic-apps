import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:medic_app/utils/apis/server.dart';

class AuthProvder with ChangeNotifier {
  String mobNumber = '';
  String otp = "";
  final String url = MAIN_API_URL;

  checkIsOK(http.Response repo) {}

  Future otpRequest(String number) async {
    mobNumber = number;
    try {
      final repo =
          await http.post(url + "auth/phone", body: {"phone": mobNumber});
      final stus = jsonDecode(repo.body);
      print(repo.statusCode);
      if (stus["status"] != "ok") {
        throw "An error ocured";
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }
  Future confirm() async {
   
    try {
      final repo =
          await http.post(url + "auth/confirm",);
      final stus = jsonDecode(repo.body);
      print(repo.statusCode);
      if (stus["status"] != "ok") {
        throw "An error ocured";
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<bool> otpVerify(String otp) async {
    try {
      final repo = await http.post(url + "auth/phone/verify", body: {
        "phone": mobNumber,
        "otp": otp,
      });
      final stus = jsonDecode(repo.body);
      print(repo.body);
      if (repo.statusCode == 200) {
        if (stus["status"] == "approved") {
          return true;
        } else {
          return false;
        }
      } else {
        throw "An error occured";
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
