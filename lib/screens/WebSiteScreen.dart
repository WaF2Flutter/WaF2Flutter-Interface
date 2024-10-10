import 'package:flutter/material.dart';
import 'package:msf/controllers/IdleController.dart';
import 'package:msf/screens/websites/websites_screen.dart';
import 'package:msf/utills/responsive.dart';
import 'component/SideBar.dart';
import 'package:get/get.dart';

class Websitescreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.find<IdleController>().onUserInteraction();
      },
      child: Scaffold(
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                child: SideBar(),
              ),
            Expanded(
              flex: 5,
              //صفحه اصلیمون که روش باید کار بشه
             child: websites_screen(),
            ),
          ],
        ),
      
      ),
    );
  }
}