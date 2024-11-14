import 'package:get/get.dart';
import 'package:msf/controllers/auth/CaptchaController.dart';
import 'package:msf/controllers/dashboard/CounterController.dart';
import 'package:msf/controllers/auth/LoginController.dart';
import 'package:msf/controllers/settings/MenuController.dart';
import 'package:msf/controllers/settings/ThemeController.dart';
import 'package:msf/controllers/settings/TranslateController.dart';
import 'package:msf/controllers/settings/IdleController.dart';
import 'package:msf/controllers/dashboard/ResourceUsageController.dart';
import '../controllers/ws/WsController.dart';


class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => Menu_Controller());
    Get.put(Counter());
    Get.lazyPut(() => TranslateController());
    Get.put(IdleController());
    Get.lazyPut(() => ResourceUsageController());
    Get.put(WsController());
    Get.lazyPut(()=>CaptchaController());
  }
}


