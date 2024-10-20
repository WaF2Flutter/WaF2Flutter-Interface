import 'package:get/get.dart';

class Counter extends GetxController{

  final RxInt _time = RxInt(15*60); 

  String get remainingSec {
    int minutes = _time.value ~/ 60;
    int seconds = _time.value % 60;
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  void _countdown() {
    if(_time.value > 0) {
      _time.value--;  
      Future.delayed(Duration(seconds: 1), _countdown);
    }
  }

  @override
  void onInit() {
    super.onInit();
    _countdown();
  }

}
