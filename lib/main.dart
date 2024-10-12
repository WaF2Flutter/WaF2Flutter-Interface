import 'package:flutter/material.dart';
import 'package:msf/bindings/bindings.dart';
import 'package:get/get.dart';
import 'package:msf/screens/HomeScreen.dart';
import 'package:msf/screens/LoginScreen.dart';
import 'package:msf/screens/WebSiteScreen.dart';
import 'package:msf/utills/theme.dart';
import 'package:msf/utills/translator.dart';
import 'package:msf/controllers/ThemeController.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ThemeController()); 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = Get.find<ThemeController>().isDark.value;

      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: Translator(),
        initialBinding: MyBindings(),
        getPages: [
          GetPage(name: '/home', page: () => HomeScreen()),
          GetPage(name: '/websites', page: () => Websitescreen()),
          GetPage(name: '/l', page: () => LoginScreen()),
        ],
        initialRoute: '/home', 
        title: 'ModSec Admin Panel'.tr,
        theme: getTheme(isDark), 
      );
    });
  }
}
