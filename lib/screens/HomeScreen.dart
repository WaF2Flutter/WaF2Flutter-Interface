import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msf/controllers/settings/IdleController.dart';
import 'package:msf/controllers/ws/WsController.dart';
import 'package:msf/screens/dashboard/dashboard_screen.dart';
import 'package:msf/utills/responsive.dart';
import 'component/SideBar.dart';
import 'package:msf/controllers/settings/MenuController.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final Menu_Controller menuController = Get.find<Menu_Controller>();
  final WsController comController = Get.find<WsController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<IdleController>().onUserInteraction();
      },
      child: Scaffold(
        key: scaffoldKey,
        drawer: !Responsive.isDesktop(context)
            ? const Drawer(
          child: SideBar(),
        )
            : null,
        body: Obx(() {
          if (comController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (!comController.isConnected.value) {
            return Center(
              child: Text("Failed to connect to WebSocket"),
            );
          } else {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (Responsive.isDesktop(context))
                  const Expanded(
                    child: SideBar(),
                  ),
                Expanded(
                  flex: 5,
                  child: DashboardScreen(scaffoldKey: scaffoldKey),
                ),
              ],
            );
          }
        }),

      ),
    );
  }
}
