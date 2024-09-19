import 'dart:convert';

import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:msf/screens/HomeScreen.dart';

import '../unit/com.dart';

class LoginController extends GetxController {
  var loginProcess = false.obs;
  var loginSuccess = false.obs;

  String username = "";
  String password = "";
  final Communication _communication = Communication();

  Future<void> login(String username, String password) async {
    this.username = username;
    this.password = password;
    print("recived login inss");

    if (!_communication.isConnected()) {
      _communication.establishWebSocketConnection();
    }

    if (_communication.isConnected()) {
      if (username.isEmpty || password.isEmpty) {
        Get.snackbar(
          "",
          "",
          titleText: const Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: Text("Error"),
          ),
          messageText: const Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: Text("Please fill the inputs correctly!"),
          ),
          icon: const Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Icon(
              Icons.info_sharp,
              size: 30,
            ),
          ),
          maxWidth: 360,
          isDismissible: true,
        );
        return;
      }
      loginProcess.value = true;
      final success = await _communication.sendLoginSession(username, password) ?? false;
      if (success) {
        loginSuccess.value = true;
        Get.snackbar(
          "",
          "",
          titleText: const Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: Text("Login Succesfull!"),
          ),
          messageText: const Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: Text("Welcome dear test."),
          ),
          icon: const Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Icon(
              Icons.info_sharp,
              size: 30,
            ),
          ),
          maxWidth: 360,
          isDismissible: true,
        );
        await Get.to(() => HomeScreen());
      } else {
        loginSuccess.value = false;
        Get.snackbar(
          "",
          "",
          titleText: const Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: Text("Error"),
          ),
          messageText: const Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: Text("Invalid username or password"),
          ),
          icon: const Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Icon(
              Icons.info_sharp,
              size: 30,
            ),
          ),
          maxWidth: 360,
          isDismissible: true,
        );
      }
      loginProcess.value = false;
    } else {
      Get.snackbar(
        "",
        "",
        titleText: const Padding(
          padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
          child: Text("Error"),
        ),
        messageText: const Padding(
          padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
          child: Text("Check your internet connection !"),
        ),
        icon: const Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Icon(
            Icons.info_sharp,
            size: 30,
          ),
        ),
        maxWidth: 360,
        isDismissible: true,
      );
      print("Cannot connect to websocket");
    }
  }
}