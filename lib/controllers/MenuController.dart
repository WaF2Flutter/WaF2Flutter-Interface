import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  void opennDrawer() {
    scaffoldKey.currentState!.openDrawer();
    update();
  }
}
