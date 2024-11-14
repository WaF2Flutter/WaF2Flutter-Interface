import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:msf/controllers/dashboard/CounterController.dart';
import 'package:msf/utills/colorconfig.dart';
import 'package:msf/utills/responsive.dart';
import 'package:msf/controllers/settings/MenuController.dart';

class Header extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Menu_Controller menuController = Get.find<Menu_Controller>();

  Header({required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            onPressed: () {
              menuController.openDrawer(scaffoldKey);
            },
            icon: const Icon(Icons.menu_sharp),
          ),
        if (!Responsive.isMobile(context))
          AutoSizeText(
            "Docs".tr,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 1 : 2),
        Spacer(),
        GestureDetector(
          onTap: (){
            Get.toNamed("/home");
          },
          child: Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: secondryColor),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Icon(Icons.arrow_back_ios_sharp),
                  SizedBox(width: 6,),
                  Text(
                    "Back".tr,
                  ),
                ]),
              )),
        ),
        SizedBox(width: 10),

      ],
    );
  }

  void _showLogoutConfirmation() {
    Get.dialog(
      AlertDialog(
        backgroundColor: secondryColor,
        title: Text(
          "Logout".tr,
          style: TextStyle(color: Colors.white),
        ),
        content: Text(
          "Are you sure you want to logout?".tr,
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              "Cancel".tr,
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("Confirm".tr),
          ),
        ],
      ),
      barrierDismissible: true,
    );
  }
}
