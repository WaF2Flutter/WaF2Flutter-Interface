import 'dart:convert';
import 'package:get/get.dart';
import 'package:msf/unit/api/WebSocketService.dart';
import 'package:msf/unit/com.dart';

import '../unit/api/HttpService.dart';
import 'ResourceUsageController.dart';

class WsConnection extends GetxController {
  final Com api = Com(
    httpService: HttpService(),
    webSocketService: WebSocketService(),
  );

  var isLoading = true.obs;
  var isConnected = false.obs;

  @override
  void onInit() {
    super.onInit();
    connectWebSocket();
  }

  Future<void> connectWebSocket() async {
    isLoading.value = true;
    bool connected = await api.wsConnect(processIncomingData);
    isConnected.value = connected;
    isLoading.value = false;

    if (connected) {
      api.sendMessageOverSocket("start_system_info");
    } else {
      print("Failed to connect to WebSocket.");
    }
  }

  void processIncomingData(String message) {
    print("WebSocket received data: $message");
    try {
      Map<String, dynamic> data = jsonDecode(message);

      if (data.containsKey('cpu_usage') ||
          data.containsKey('memory_usage_percentage') ||
          data.containsKey('cloud_usage_percentage') ||
          data.containsKey('traffic_usage')) {

        _updateResourceUsage(data);
        print("WebSocket updated resource usage data.");
      }
    } catch (e) {
      print("Failed to process incoming data: $e");
    }
  }

  void _updateResourceUsage(Map<String, dynamic> data) {
    final resourceUsageController = Get.find<ResourceUsageController>();
    resourceUsageController.updateUsageData(data);
  }

  void sendMessage(String message) async {
    if (isConnected.value) {
      api.sendMessageOverSocket(message);
      print("Sent message: $message");
    } else {
      print('WebSocket is not connected. Retrying in 1 second...');
      await Future.delayed(Duration(seconds: 1));

      if (isConnected.value) {
        api.sendMessageOverSocket(message);
      } else {
        print("Message was not sent.");
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
    api.closeWebSocketConnection();
    print("WebSocket connection closed on controller dispose.");
  }
}
