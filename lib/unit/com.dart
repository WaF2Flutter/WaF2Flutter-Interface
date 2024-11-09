import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/web_socket_channel.dart';

import '../controllers/WsConnection.dart';

class Com {
  bool _loginSuccess = false;
  String? sessionId;
  WebSocketChannel? channel;
  bool _isConnected = false;


  bool get isConnected => _isConnected;

  Future<bool> wsConnect() async {
    try {
      channel = WebSocketChannel.connect(Uri.parse("ws://127.0.0.1:8081/ws"));

      channel!.stream.listen(
            (message) {
          print("Received data: $message");
          Get.find<WsConnection>().processIncomingData(message);
        },
        onError: (error) {
          print("WebSocket connection error: $error");
          _isConnected = false;
          channel?.sink.close();
        },
        onDone: () {
          print("WebSocket connection closed.");
          _isConnected = false;
        },
      );

      _isConnected = true;
      return true;
    } catch (e) {
      print("Failed to connect: $e");
      _isConnected = false;
      return false;
    }
  }

  void sendMessage(String message) {
    if (_isConnected && channel != null) {
      channel!.sink.add(message);
      print("Sent message: $message");
    } else {
      print('Cannot send message: WebSocket is not connected.');
    }
  }




  Future<void> login(String username, String password) async {
    String url = 'http://127.0.0.1:8081/login';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['login_status'] == 'pending') {
          sessionId = jsonData['id'];
          print("OTP sent, session id: $sessionId");
        } else {
          print("Unexpected login status: ${jsonData['login_status']}");
        }
      } else {
        print("Login failed with status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error during login request: $e");
    }
  }

  Future<bool> verifyOtp(int otp) async {
    String url = 'http://127.0.0.1:8081/verify_otp';
    if (sessionId == null) {
      print("ID not found");
      return false;
    }

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'session_id': sessionId!,
          'otp': otp,
        }),
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['login_status'] == 'success') {
          print("login success");
          _loginSuccess = true;
          return true;
        } else {
          print("Unexpected response: ${jsonData['login_status']}");
        }
      } else {
        print(
            "OTP verification failed with status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error during OTP verification: $e");
    }
    return false;
  }


}

// Todo: You can add methods to send messages or handle WebSocket disconnect
/*
  void sendMessage(String message) {
    if (_isConnected) {
      _webSocket.sink.add(message);
    } else {
      print('Cannot send message: WebSocket is not connected.');
    }
  }

  void disconnect() {
    if (_webSocket != null && _isConnected) {
      _webSocket.sink.close();
      _isConnected = false;
    }
  }
  */
