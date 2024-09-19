import 'dart:async';

import 'package:get/get.dart';
import 'package:msf/screens/LoginScreen.dart';

class IdleController extends GetxController{

final IdleTimeout _idleTimeout = IdleTimeout();

  @override
  void onInit() {
    _idleTimeout.startTimeout(Duration(minutes: 1));
    super.onInit();
  }

  void onUserInteraction() {
    _idleTimeout.resetTimeout();
  }
}

class IdleTimeout {
  late Timer _timer;

  void startTimeout(Duration duration) {
        print("TimeOut Started");
    _timer = Timer(duration, onTimeout);
  }

  void resetTimeout() {
    _timer.cancel();
    startTimeout(Duration(minutes: 1));
    print("TimeOut Resets");
  }

  void onTimeout() {
        print("TimeOut Finished process to login");
    Get.offAll(LoginScreen());
  }
}