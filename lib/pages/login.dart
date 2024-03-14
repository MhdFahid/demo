import 'package:demo/api/login_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  LoginApi loginApi = Get.put(LoginApi());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Online Shop',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: loginApi.username,
              decoration: const InputDecoration(
                  hintText: 'Username', border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(
              () => TextField(
                obscureText: !loginApi.obscureText.value,
                controller: loginApi.password,
                decoration: const InputDecoration(
                    hintText: 'Password', border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Obx(
                  () => Checkbox(
                      value: loginApi.obscureText.value,
                      onChanged: (valu) {
                        loginApi.obscureText.value = valu!;
                      }),
                ),
                const Text("Remember"),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                await loginApi.getLogin();
              },
              child: const Text('Login'),
            )
          ],
        ),
      ),
    ));
  }
}
