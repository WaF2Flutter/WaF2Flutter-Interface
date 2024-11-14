import 'package:get/get.dart';
import 'dart:math';

class CaptchaController extends GetxController {
  var captcha = ''.obs;

  var isCaptchaCorrect = false.obs;

  @override
  void onInit() {
    super.onInit();
    generateCaptcha();
  }

  void generateCaptcha() {
    const letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
    const length = 6;
    final random = Random();
    captcha.value = String.fromCharCodes(
      List.generate(length, (index) => letters.codeUnitAt(random.nextInt(letters.length))),
    );
    isCaptchaCorrect.value = false;
  }

  void verifyCaptcha(String userInput) {
    isCaptchaCorrect.value = userInput == captcha.value;
  }
}
