import 'package:flutter/material.dart';
import 'package:msf/screens/dashboard/dashboard_screen.dart';
import 'package:msf/utills/responsive.dart';
import 'component/SideBar.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Drawer flex 1/6
          if (Responsive.isDesktop(context))
            const Expanded(
              child: SideBar(),
            ),
          //Drawer flex 5/6
          const Expanded(
            flex: 5,
            child: DashboardScreen(),
          ),
        ],
      ),

    );
  }
}