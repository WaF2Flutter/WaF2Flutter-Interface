import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IdleController extends GetxController {
  Timer? _idleTimer;

 void _showIdleSnackbar() {
Get.snackbar(
  'Idle Alert'.tr, 
  'You have been idle for some min. Do you want to stay?'.tr, 
  snackPosition: SnackPosition.TOP, 
  maxWidth: 450,
  margin: EdgeInsets.all(10), 
  colorText: Colors.black45, 
  duration: Duration(seconds: 1000), 
  isDismissible: false,

  mainButton: TextButton(
    onPressed: () {
      onUserInteraction();
      Get.back();
    },
    child: Text('YES'.tr),
  ),
);
}

  void onUserInteraction() {
    _idleTimer?.cancel();
    _idleTimer = Timer.periodic(Duration(seconds: 30), (timer) {
      _showIdleSnackbar();
    });
  }
  @override
  void onInit() {
    super.onInit();
    _idleTimer = Timer.periodic(Duration(seconds: 30), (timer) {
      _showIdleSnackbar();
    });
  }

  @override
  void onClose() {
    _idleTimer?.cancel();
    super.onClose();
  }
}