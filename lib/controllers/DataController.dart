//IN DEV mode this data's are sample.
import 'dart:async';
import 'dart:math';
import 'package:get/get.dart';

class DataController extends GetxController {

  Random _random = Random();

  var cpuUsage = 75.obs;
  var cloudUsage = 50.obs;
  var memoryUsage = 90.obs;
  var trafficUsage = 60.obs;

  var cpuFiles = 8.obs;
  var cloudFiles = 502.obs;
  var memoryFiles = 15.obs;
  var trafficFiles = 600.obs;

  var cpuStorage = "80%".obs;
  var cloudStorage = "800 MB".obs;
  var memoryStorage = "16 GB".obs;
  var trafficStorage = "1 TB".obs;

  @override
  void onInit() {
    super.onInit();
    _startUpdatingData(); 
  }

  void _startUpdatingData() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      cpuUsage.value = _random.nextInt(100);
      cloudUsage.value = _random.nextInt(100);
      memoryUsage.value = _random.nextInt(100);
      trafficUsage.value = _random.nextInt(100);

      cpuFiles.value = _random.nextInt(50);
      cloudFiles.value = _random.nextInt(1000);
      memoryFiles.value = _random.nextInt(50);
      trafficFiles.value = _random.nextInt(1000);
    });
  }
}
