import 'package:get/get.dart';
import 'package:msf/data/ResourceUsage.dart';

class ResourceUsageController extends GetxController {
  var resourceUsage = ResourceUsage().obs;

  @override
  void onInit() {
    super.onInit();
  }

  void updateUsageData(Map<String, dynamic> data) {
    resourceUsage.update((res) {
      if (res != null) {
        res.cpuUsage = data['cpu_usage']?.toInt() ?? res.cpuUsage;
        res.cloudUsage = data['cloud_usage_percentage']?.toInt() ?? res.cloudUsage;
        res.memoryUsage = data['memory_usage_percentage']?.toInt() ?? res.memoryUsage;
        res.trafficUsage = data['traffic_usage']?.toInt() ?? res.trafficUsage;

        res.cpuFiles = data['cpu_files'] ?? res.cpuFiles;
        res.cloudFiles = data['cloud_files'] ?? res.cloudFiles;
        res.memoryFiles = data['memory_files'] ?? res.memoryFiles;
        res.trafficFiles = data['traffic_files'] ?? res.trafficFiles;

        res.cpuStorage = data['cpu_storage'] ?? res.cpuStorage;
        res.cloudStorage = data['cloud_usage_total'] ?? res.cloudStorage;
        res.memoryStorage = data['memory_usage_total'] ?? res.memoryStorage;
        res.trafficStorage = data['traffic_usage_total'] ?? res.trafficStorage;
      }
    });
    resourceUsage.refresh();
    print("Updated data: $data");

  }

}
