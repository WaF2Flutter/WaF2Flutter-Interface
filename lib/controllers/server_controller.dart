/*
import 'package:get/get.dart';
import 'server_stats.dart';
import 'resource_usage.dart';
import 'waf_logs.dart';
import 'server_config.dart';

class ServerController extends GetxController {
  var serverStats = ServerStats(cpuUsage: 0, memoryUsage: 0, trafficUsage: 0, diskUsage: 0, timestamp: DateTime.now()).obs;
  var resourceUsageList = <ResourceUsage>[].obs;
  var wafLogsList = <WAFLog>[].obs;
  var serverConfig = ServerConfig(osVersion: '', modSecurityVersion: '', serverLocation: '').obs;

  // Method to handle WebSocket updates
  void updateFromWebSocket(Map<String, dynamic> data) {
    // Assuming the incoming data is a JSON object with multiple fields
    if (data.containsKey('server_stats')) {
      serverStats.value = ServerStats.fromJson(data['server_stats']);
    }
    if (data.containsKey('resource_usage')) {
      resourceUsageList.value = (data['resource_usage'] as List).map((e) => ResourceUsage.fromJson(e)).toList();
    }
    if (data.containsKey('waf_logs')) {
      wafLogsList.value = (data['waf_logs'] as List).map((e) => WAFLog.fromJson(e)).toList();
    }
    if (data.containsKey('server_config')) {
      serverConfig.value = ServerConfig.fromJson(data['server_config']);
    }
  }

  // Add other methods for connecting to WebSocket, handling reconnection, etc.
}
*/