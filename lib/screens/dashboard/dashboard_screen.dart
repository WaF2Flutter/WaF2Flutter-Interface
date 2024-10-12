import 'package:flutter/material.dart';
import '../component/Header.dart';
import 'sections/Dashboard.dart';

class DashboardScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey; 

  const DashboardScreen({super.key, required this.scaffoldKey}); 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Header(scaffoldKey: scaffoldKey),
            const SizedBox(height: 16),
            Column(
              children: [
                Dashboard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
