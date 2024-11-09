import 'dart:convert';
import 'package:get/get.dart';
import 'package:msf/unit/com.dart';
import 'ResourceUsageController.dart';

class WsConnection extends GetxController {
  final Com _comService = Com();
  var isLoading = true.obs;
  var isConnected = false.obs;

  @override
  void onInit() {
    super.onInit();
   connectWebSocket();
  }

  Future<void> connectWebSocket() async {
    isLoading.value = true;
    bool connected = await _comService.wsConnect();
    isConnected.value = connected;
    isLoading.value = false;

    if (connected) {
      sendMessage("start_system_info");
    } else {
      print("Failed to connect to WebSocket.");
    }
  }


  void processIncomingData(String message) {
    try {
      Map<String, dynamic> data = jsonDecode(message);
      print("WebSocket received data: $message");

      if (data.containsKey('cpu_usage') ||
          data.containsKey('memory_usage_percentage') ||
          data.containsKey('cloud_usage_percentage') ||
          data.containsKey('traffic_usage')) {

        _updateResourceUsage(data);
        print("WebSocket Updated messages");
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
      _comService.sendMessage(message);
      print("Sent message: $message");
    } else {
      print('E.WebSocket is not connected. Retrying in 1 second...');
      await Future.delayed(Duration(seconds: 1));

      if (isConnected.value) {
        _comService.sendMessage(message);
      } else {
        print("E,Message was not sent.");
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
    if (_comService.channel != null) {
      _comService.channel!.sink.close();
      print("WebSocket connection closed on controller dispose.");
    }
  }
}
