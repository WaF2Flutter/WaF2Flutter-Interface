import 'package:get/get.dart';

class ThemeController extends GetxController{
  var isDark = false.obs;
  void toggle()
  {
    isDark.value = !isDark.value;
  }
}