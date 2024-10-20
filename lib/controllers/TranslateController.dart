import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TranslateController extends GetxController {
  var isEnglish = true.obs; 

  void changeLang(String lang) {
    isEnglish.value = lang == 'en';
    var locale = Locale(lang);
    Get.updateLocale(locale);
  }
}
