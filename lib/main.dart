import 'package:flutter/material.dart';
import 'package:msf/bindings/bindings.dart';
import 'package:get/get.dart';
import 'package:msf/controllers/settings/ThemeController.dart';
import 'package:msf/screens/HomeScreen.dart';
import 'package:msf/screens/LoginScreen.dart';
import 'package:msf/screens/SettingScreen.dart';
import 'package:msf/screens/WebSiteScreen.dart';
import 'package:msf/screens/doc/doc.dart';
import 'package:msf/screens/login/OtpScreen.dart';
import 'package:msf/services/unit/api/config/Config.dart';
import 'package:msf/utills/theme.dart';
import 'package:msf/utills/translator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Config.loadConfig();
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
          GetPage(name: '/l', page: () => LoginScreen()),
          GetPage(name: '/home', page: () => HomeScreen()),
          GetPage(name: '/websites', page: () => Websitescreen()),
          GetPage(name: '/setting', page: () => Settingscreen()),
          GetPage(name: '/otp', page: () => OtpScreen()),
          GetPage(name: '/doc', page: () => DocScreen()),
        ],
        navigatorObservers: [
          GetObserver((_){
     print('User route: ${Get.currentRoute}');
      })
        ],
        initialRoute: '/l',
        title: 'ModSec Admin Panel'.tr,
        theme: getTheme(isDark), 
      );
    });
  }
}
