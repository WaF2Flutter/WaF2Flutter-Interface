import 'package:flutter/material.dart';
import 'package:msf/bindings/bindings.dart';
import 'package:msf/controllers/ThemeController.dart';
import 'package:msf/screens/HomeScreen.dart';
import 'package:get/get.dart';
import 'package:msf/utills/theme.dart';
import 'package:msf/utills/translator.dart';

void main() {
  runApp(MyApp());
}

const Color bgColor = Color.fromARGB(255, 31, 30, 45);
const Color secondryColor = Color(0xFF2A2D3E);
const Color primaryColor = Color(0xFF2697FF);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      Get.put(ThemeController());
      bool isDark = Get.find<ThemeController>().isDark.value;

      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: Translator(),
        initialBinding: MyBindings(),
        getPages: [
          GetPage(name: '/home', page: () => HomeScreen()),
        ],
        initialRoute: '/home',
        title: 'ModSec Admin Panel'.tr,
        theme: getTheme(isDark),
        home: HomeScreen(),
      );
    });
  }
}
