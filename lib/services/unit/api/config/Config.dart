import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Config {
  static String? httpAddress;
  static String? websocketAddress;

  static Future<void> loadConfig() async {
    final configData = await rootBundle.loadString('assets/config.json');
    final config = jsonDecode(configData);
    httpAddress = config['http_address'];
    websocketAddress = config['websocket_address'];
  }
}
