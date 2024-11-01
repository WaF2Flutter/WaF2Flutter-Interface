import 'package:get/get.dart';
import 'package:msf/controllers/CounterController.dart';
import 'package:msf/controllers/LoginController.dart';
import 'package:msf/controllers/MenuController.dart';
import 'package:msf/controllers/ThemeController.dart';
import 'package:msf/controllers/TranslateController.dart';
import 'package:msf/controllers/IdleController.dart';
import 'package:msf/controllers/ResourceUsageController.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.put(Menu_Controller());
    Get.put(ThemeController()); 
    Get.put(Counter()); 
    Get.put(TranslateController());
    Get.put(IdleController());
    Get.put(ResourceUsageController(), permanent: false);
  }
}
