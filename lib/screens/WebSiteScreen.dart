import 'package:flutter/material.dart';
import 'package:msf/controllers/IdleController.dart';
import 'package:msf/screens/websites/websites_screen.dart';
import 'package:msf/utills/responsive.dart';
import '../controllers/MenuController.dart';
import 'component/SideBar.dart';
import 'package:get/get.dart';

class Websitescreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _webScaffoldKey = GlobalKey<ScaffoldState>();  // Unique GlobalKey

  final Menu_Controller menuController = Get.put(Menu_Controller());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<IdleController>().onUserInteraction();
      },
      child: Scaffold(
        key: _webScaffoldKey, 
        drawer: !Responsive.isDesktop(context)
            ? const Drawer(
                child: SideBar(),
              )
            : null,
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                child: SideBar(),
              ),
            Expanded(
              flex: 5,
              child: websites_screen(),
            ),
          ],
        ),
      ),
    );
  }
}
