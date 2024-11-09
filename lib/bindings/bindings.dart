import 'package:get/get.dart';
import 'package:msf/controllers/CounterController.dart';
import 'package:msf/controllers/LoginController.dart';
import 'package:msf/controllers/MenuController.dart';
import 'package:msf/controllers/ThemeController.dart';
import 'package:msf/controllers/TranslateController.dart';
import 'package:msf/controllers/IdleController.dart';
import 'package:msf/controllers/ResourceUsageController.dart';
import '../controllers/WsConnection.dart';


class MyBindings implements Bindings {
  @override
  void dependencies() {
    print("Initializing MyBindings...");
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => Menu_Controller());
    Get.lazyPut(() => ThemeController());
    Get.put(Counter());
    Get.lazyPut(() => TranslateController());
    Get.put(IdleController());
    Get.lazyPut(() => ResourceUsageController());
    Get.put(WsConnection());
    print("MyBindings initialized.");
  }
}


