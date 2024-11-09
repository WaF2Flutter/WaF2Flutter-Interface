import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msf/screens/HomeScreen.dart';
import '../unit/com.dart';

class LoginController extends GetxController {
  var loginProcess = false.obs;
  var loginSuccess = false.obs;
  var otpRequired = false.obs;

  String username = "";
  String password = "";

  final Com _communication = Com();

  Future<void> login(String username, String password) async {
    this.username = username;
    this.password = password;
    print("received login input");

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
    await _communication.login(username, password);

    if (_communication.sessionId != null) {
      otpRequired.value = true;
      Get.snackbar(
        "",
        "",
        titleText: const Padding(
          padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
          child: Text("OTP Sent"),
        ),
        messageText: const Padding(
          padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
          child: Text("Please enter the OTP sent to your device."),
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

      await Get.toNamed("/otp");
    } else {
      otpRequired.value = false;
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
  }

  Future<void> verifyOtp(int otp) async {
    loginProcess.value = true;

    final otpSuccess = await _communication.verifyOtp(otp);

    if (otpSuccess) {
      loginSuccess.value = true;
      otpRequired.value = false;
      Get.snackbar(
        "",
        "",
        titleText: const Padding(
          padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
          child: Text("Login Successful!"),
        ),
        messageText: const Padding(
          padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
          child: Text("Welcome to the application."),
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
      await Get.off(() => HomeScreen());
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
          child: Text("Invalid OTP. Please try again."),
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
  }
}
