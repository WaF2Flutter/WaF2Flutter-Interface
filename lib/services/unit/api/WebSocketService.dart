import 'package:web_socket_channel/web_socket_channel.dart';

import 'config/Config.dart';
class WebSocketService {
  WebSocketChannel? channel;
  bool _isConnected = false;

  bool get isConnected => _isConnected;

  Future<bool> wsConnect(Function(String) onMessageReceived) async {
    try {
      channel = WebSocketChannel.connect(Uri.parse(Config.websocketAddress!));
      channel!.stream.listen(
            (message) {
          print("Received data: $message");
          onMessageReceived(message);
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

  void closeConnection() {
    channel?.sink.close();
    _isConnected = false;
  }
}
