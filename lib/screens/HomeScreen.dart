import 'package:flutter/material.dart';
import 'package:msf/controllers/IdleController.dart';
import 'package:msf/screens/dashboard/dashboard_screen.dart';
import 'package:msf/utills/responsive.dart';
import 'component/SideBar.dart';
import 'package:get/get.dart';
import 'package:msf/controllers/MenuController.dart'; 

class HomeScreen extends StatelessWidget {

  final Menu_Controller menuController = Get.put(Menu_Controller());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.find<IdleController>().onUserInteraction();
      },
      child: Scaffold(
        key: menuController.scaffoldKey, 
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
            const Expanded(
              flex: 5,
              child: DashboardScreen(),
            ),
          ],
        ),
      
      ),
    );
  }
}
