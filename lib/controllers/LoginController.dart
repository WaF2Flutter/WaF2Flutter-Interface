import "package:get/get.dart";
import 'package:msf/screens/HomeScreen.dart';
class LoginController extends GetxController {

  var loginProcess = false.obs;
  var error = "".obs;

  String username = "";
  String password = "";

 Future<void> login(String username, String password) async {
  this.username = username;
  this.password = password;
  print("recived login inss");
  if (username.isEmpty || password.isEmpty) {
    error.value = "Please enter both username and password";
    return;
  }
  if (username == "test" && password == "test") {
    Get.to(HomeScreen());
  } else {
    error.value = "Login Error";
  }
}
}