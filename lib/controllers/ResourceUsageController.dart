import 'dart:async';
import 'dart:math';
import 'package:get/get.dart';
import 'package:msf/data/ResourceUsage.dart';

class ResourceUsageController extends GetxController {
  var resourceUsage = ResourceUsage().obs;
  final Random _random = Random();

  @override
  void onInit() {
    super.onInit();
    _startUpdatingData();
  }

  void updateRandomUsageData() {
    resourceUsage.update((res) {
      if (res != null) {
        res.cpuUsage = _random.nextInt(100);
        res.cloudUsage = _random.nextInt(100);
        res.memoryUsage = _random.nextInt(100);
        res.trafficUsage = _random.nextInt(100);

        res.cpuFiles = _random.nextInt(50);
        res.cloudFiles = _random.nextInt(1000);
        res.memoryFiles = _random.nextInt(50);
        res.trafficFiles = _random.nextInt(1000);

        res.cpuStorage = "${_random.nextInt(100)}%";
        res.cloudStorage = "${_random.nextInt(1000)} MB";
        res.memoryStorage = "${_random.nextInt(32)} GB";
        res.trafficStorage = "${_random.nextInt(1000)} GB";
      }
    });
  }

  void _startUpdatingData() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      updateRandomUsageData();
    });
  }
}
