import 'package:get/get.dart';

class MenuController extends GetxController {
  final RxBool _isMenuOpen = false.obs;

  bool get isMenuOpen => _isMenuOpen.value;

  void toggleMenu() {
    _isMenuOpen.value = !_isMenuOpen.value;
  }
}