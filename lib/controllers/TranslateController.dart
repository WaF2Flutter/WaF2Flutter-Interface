import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Translatecontroller  extends GetxController{

  void ChangeLang(String Lang)
  {
    var locale = Locale(Lang);
    Get.updateLocale(locale);
  }
}