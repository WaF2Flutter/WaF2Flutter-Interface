import 'package:get/get.dart';
import 'package:msf/controllers/MenuController.dart';
//import 'package:msf/controllers/DataController.dart';
//import 'package:msf/controllers/PortController.dart';

class MyBindings implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(()=>MenuController());
  // Get.lazyPut(()=>DataController());
  // Get.lazyPut(()=>PortController());
   }
  }