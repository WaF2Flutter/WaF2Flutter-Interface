import 'dart:async';
import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';

//import 'package:msf/controllers/ResourceUsageController.dart';

class Communication {
  late WebSocketChannel _webSocket;
  bool _isConnected = false;
  bool _loginSuccess = false;
  final _responseStreamController = StreamController<String>.broadcast();


  void establishWebSocketConnection() {
    try {
      //Url for connection.
      String url = "ws://26.68.236.137:8080";
      _webSocket = WebSocketChannel.connect(Uri.parse(url));
      _webSocket.stream.listen((message) {
        _responseStreamController.add(message);
      }, onError: (error) {
        print('Error occurred: $error');
        _isConnected = false;
      }, onDone: () {
        print('WebSocket connection closed');
        _isConnected = false;
      });

      _isConnected = true;
    } catch (e) {
      print('Error establishing WebSocket connection: $e');
    }
  }
  Future<bool?> sendLoginSession(String username, String password) async {
    if (_isConnected) {
      _webSocket.sink.add('-login' + username + password);
      final response = await _responseStreamController.stream.first;
      if (response.isNotEmpty) {
        final jsonData = jsonDecode(response);
        if (jsonData['login_status'] == 'success') {
          print("success");
          return true;
        } else {
          return false;
        }
      }
    } else {
      print('Cannot create login session: webSocket is not connected.');
      return false;
    }
  }
  bool isConnected() {
    return _isConnected;
  }
}
//Todo: its usable usefull for communication between server and app
/*
  void sendMessage(String message) {
    if (_isConnected) {
      _webSocket.sink.add(message);
    } else {
      print('Cannot send message: webSocket is not connected.');
    }
  }

  void disconnect() {
    if (_webSocket != null && _isConnected) {
      _webSocket.sink.close();
      _isConnected = false;
    }
  }
  */