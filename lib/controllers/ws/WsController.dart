import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msf/services/unit/api/WebSocketService.dart';
import 'package:msf/services/unit/com.dart';
import '../../services/unit/api/HttpService.dart';
import '../dashboard/ResourceUsageController.dart';

class WsController extends GetxController {

  final Com api = Com(
    httpService: HttpService(),
    webSocketService: WebSocketService(),
  );

  var isLoading = true.obs;
  var isConnected = false.obs;
  Timer? _statusCheckTimer;

  @override
  void onInit() {
    super.onInit();
    connectWebSocket();
    _startPeriodicStatusCheck();
  }

  Future<void> connectWebSocket() async {
    isLoading.value = true;
    bool connected = await api.wsConnect(processIncomingData);
    isConnected.value = connected;
    isLoading.value = false;

    if (connected) {
      sendMessage("start_system_info", messageType: 'system_info');
    } else {
      showDisconnectedDialog();
      print("Failed to connect to WebSocket.");
    }
  }

  void processIncomingData(String message) {
    print("WebSocket received data: $message");
    try {
      Map<String, dynamic> data = jsonDecode(message);
      String messageType = data['type'];
      Map<String, dynamic> payload = data['payload'];

      switch (messageType) {
        case 'system_info':
          _updateResourceUsage(payload);
          break;
        case 'user_info':
          _handleUserInfo(payload);
          break;
        case 'notification':
          _handleNotification(payload);
          break;
        default:
          print("Unknown message type: $messageType");
      }
    } catch (e) {
      print("Failed to process incoming data: $e");
    }
  }

  void _updateResourceUsage(Map<String, dynamic> data) {
    final resourceUsageController = Get.find<ResourceUsageController>();
    resourceUsageController.updateUsageData(data);
  }

  void _handleUserInfo(Map<String, dynamic> data) {
    print("User info received: $data");
  }

  void _handleNotification(Map<String, dynamic> data) {
    print("Notification received: $data");
  }

  void sendMessage(String message, {String messageType = 'default'}) async {
    final msg = {
      'type': messageType,
      'payload': message,
    };
    String encodedMessage = jsonEncode(msg);

    if (isConnected.value) {
      api.sendMessageOverSocket(encodedMessage);
      print("Sent message: $encodedMessage");
    } else {
      print('WebSocket is not connected. Retrying in 1 second...');
      await Future.delayed(Duration(seconds: 1));
      if (isConnected.value) {
        api.sendMessageOverSocket(encodedMessage);
      } else {
        print("Message was not sent.");
        showDisconnectedDialog();
      }
    }
  }

  void _startPeriodicStatusCheck() {
    _statusCheckTimer = Timer.periodic(Duration(seconds: 10), (timer) {
      if (isConnected.value) {
        sendMessage("start_system_info", messageType: 'system_info');
      } else {
        timer.cancel();
      }
    });
  }

  void showDisconnectedDialog() {
    if (!Get.isDialogOpen!) {
      Get.dialog(
        AlertDialog(
          title: Text("Connection Lost"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text("Connection to the server was lost. Please refresh the page."),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog
                Get.back();
              },
              child: Text("OK"),
            ),
          ],
        ),
        barrierDismissible: false,
      );
    }
  }

  @override
  void onClose() {
    super.onClose();
    api.closeWebSocketConnection();
    _statusCheckTimer?.cancel();
    print("WebSocket connection closed on controller dispose.");
  }
}
