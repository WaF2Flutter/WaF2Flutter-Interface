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
    Get.lazyPut(()=>Menu_Controller());
    Get.lazyPut(()=>ThemeController());
    Get.put(Counter()); 
    Get.lazyPut(()=>TranslateController());
    Get.put(IdleController());
    Get.lazyPut(()=>ResourceUsageController());
  }
}
