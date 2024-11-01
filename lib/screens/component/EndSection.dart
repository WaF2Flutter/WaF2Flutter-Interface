import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EndSection extends StatelessWidget {
  const EndSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Beta version.If you exprience any problem or having a suggestion please tell us.".tr),
      ],
    );
  }
}
