import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Menu_Controller extends GetxController {
    void openDrawer(GlobalKey<ScaffoldState> scaffoldKey) {
        if (scaffoldKey.currentState != null && !scaffoldKey.currentState!.isDrawerOpen) {
            scaffoldKey.currentState!.openDrawer();
        }
    }

    void closeDrawer(GlobalKey<ScaffoldState> scaffoldKey) {
        if (scaffoldKey.currentState != null && scaffoldKey.currentState!.isDrawerOpen) {
            scaffoldKey.currentState!.closeDrawer();
        }
    }
}
