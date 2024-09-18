import 'package:flutter/material.dart';
import 'package:msf/bindings/bindings.dart';
import 'package:msf/controllers/ThemeController.dart';
import 'package:msf/screens/HomeScreen.dart';
import 'package:get/get.dart';
import 'package:msf/screens/LoginScreen.dart';
import 'package:msf/utills/theme.dart';
import 'package:msf/utills/translator.dart';

void main() {
  runApp(MyApp());
}

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
          GetPage(name: '/l', page: () => LoginScreen()),
        ],
        initialRoute: '/l',
        title: 'ModSec Admin Panel'.tr,
        theme: getTheme(isDark),
        home: HomeScreen(),
      );
    });
  }
}
