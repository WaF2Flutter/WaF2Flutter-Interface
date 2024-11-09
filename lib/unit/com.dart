import 'api/HttpService.dart';
import 'api/WebSocketService.dart';

class Com {
  final HttpService httpService;
  final WebSocketService webSocketService;

  Com({required this.httpService, required this.webSocketService});

  Future<void> login(String username, String password) async {
    await httpService.login(username, password);
  }

  Future<bool> verifyOtp(int otp) async {
    return await httpService.verifyOtp(otp);
  }

  Future<bool> wsConnect(Function(String) onMessageReceived) async {
    return await webSocketService.wsConnect("ws://127.0.0.1:8081/ws", onMessageReceived);
  }

  void sendMessageOverSocket(String message) {
    webSocketService.sendMessage(message);
  }

  void closeWebSocketConnection() {
    webSocketService.closeConnection();
  }
}


