import 'package:demo/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginApi extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool obscureText = true.obs;
  Future<void> getLogin() async {
    String loginUrl = 'https://fakestoreapi.com/auth/login';
    if (username.text.length < 5 || password.text.length < 5) {
      Get.showSnackbar(const GetSnackBar(
        duration: Duration(seconds: 2),
        message: 'username and password are both at least 5 characters long',
      ));
      return;
    }
    try {
      var response = await http.post(
          body: ({
            'username': username.text,
            'password': password.text,
            // 'username': "mor_2314",
            // 'password': "83r5^_",
          }),
          Uri.parse(loginUrl));

      if (response.statusCode == 200) {
        Get.to(() => HomePage());
      } else if (response.statusCode != 200) {
        Get.showSnackbar(const GetSnackBar(
          duration: Duration(seconds: 2),
          message: "server error",
        ));
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
      Get.showSnackbar(const GetSnackBar(
        duration: Duration(seconds: 2),
        message: "Invalid auth",
      ));
    }
  }
}
